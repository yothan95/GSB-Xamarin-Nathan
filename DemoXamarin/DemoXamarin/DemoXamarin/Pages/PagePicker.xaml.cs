using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace DemoXamarin.Pages
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PagePicker : ContentView
    {
        List<string> lesVilles = new List<string> { "Paris", "Nantes", "Dijon" };
        public PagePicker()
        {
            InitializeComponent();
            pkVilles.ItemsSource = lesVilles;
            //pkVilles.SelectedIndex = 0;
            dpDate.Date = DateTime.Now;
            tpTime.Time = DateTime.Now.TimeOfDay;
        }
    }
        private void pkVilles_SelectedIndexChanged(object sender, EventArgs e)
        {
            DisplayAlert("Villes", lesVilles[pkVilles.SelectedIndex] + " (" + pkVilles.SelectedIndex + ")", "Ok");
        }
}