using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using TestAPIGSB.ClassesMetier;
using Xamarin.Forms;
using Newtonsoft.Json;
using TestAPIGSB.Pages;

namespace TestAPIGSB
{
    public partial class MainPage : ContentPage
    {
        public MainPage()
        {
            InitializeComponent();
        }

        private async void btnSpecialites_Clicked(object sender, EventArgs e)
        {
            PageSpecialite page = new PageSpecialite();
            await Navigation.PushModalAsync(new NavigationPage(page));
        }
    }
}
