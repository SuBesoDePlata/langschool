using LangLearnSchool.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace LangLearnSchool.Pages
{
    /// <summary>
    /// Логика взаимодействия для AutorisationPage.xaml
    /// </summary>
    public partial class AutorisationPage : Page
    {
        public AutorisationPage()
        {
            InitializeComponent();
        }

        private void Log_BtnGo_Click(object sender, RoutedEventArgs e)
        {
            int userId = 0;
            if (LoginBox_Auth.Text.Length == 0 || PasswordBox_Auth.Password.Length == 0)
            {
                if (LoginBox_Auth.Text.Length == 0 && PasswordBox_Auth.Password.Length == 0)
                {
                    MessageBox.Show("Введите пароль и логин", "Предупреждение входа");
                }
                else if (PasswordBox_Auth.Password.Length == 0)
                {
                    MessageBox.Show("Введите пароль", "Предупреждение входа");
                }
                else if (LoginBox_Auth.Text.Length == 0)
                {
                    MessageBox.Show("Введите логин", "Предупреждение входа");
                }
            }
            else
            {
                using (LangSchoolEntities databd = new LangSchoolEntities())
                {
                    var table = databd.User.Where(l => l.Login == LoginBox_Auth.Text && l.Password == PasswordBox_Auth.Password).FirstOrDefault();
                    var tableLogin = databd.User.Where(l => l.Login == LoginBox_Auth.Text && l.Password != PasswordBox_Auth.Password).FirstOrDefault();

                    if (tableLogin != null)
                    {
                        userId = tableLogin.ID;
                        if (userId != 0)
                        {
                            MessageBox.Show("Вы не правильно ввели логин или пароль", "Ошибка входа");
                        }
                    }
                    if (table != null)
                    {
                        var rol = table.RollId;
                        if (rol == 1)
                        {
                            Manager.Frame.Navigate(new AdminPage());
                            MessageBox.Show("Вы успешно вошли", "Вход выполнен успешно");
                        }
                        else if (rol == 2)
                        {
                            Manager.Frame.Navigate(new UserPage());
                            MessageBox.Show("Вы успешно вошли", "Вход выполнен успешно");
                        }
                        else
                        {
                            MessageBox.Show("Вы не правильно ввели логин или пароль", "Ошибка входа");
                        }
                    }
                }
            }
        }
    }
}
