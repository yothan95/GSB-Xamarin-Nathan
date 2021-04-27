using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;

namespace DemoXamarin
{
    public partial class MainPage : ContentPage
    {
        public MainPage()
        {
            InitializeComponent();
            List<UnePage> lesPages = new List<UnePage>()
            {
                new UnePage() {Text = "Page Picker" ,Type=typeof(PagePicker) },
                new UnePage() {Text = "Page Table" ,Type=typeof(PageTable) },
                new UnePage() {Text = "Page Slider" ,Type=typeof(PageSlider) },
                new UnePage() {Text = "Page Caroussel" ,Type=typeof(PageCaroussel) },
                new UnePage() {Text = "Page Onglet" ,Type=typeof(PageOnglet) },
                new UnePage() {Text = "Page Triggers" ,Type=typeof(PageTriggers) },
            };

            lvMenu.ItemsSource = lesPages;
        }

        private async void lvMenu_ItemSelected(object sender, SelectedItemChangedEventArgs e)
        {
            var laPage = e.SelectedItem as UnePage;
            var detail = (Page)Activator.CreateInstance(laPage.Type);
            await Navigation.PushModalAsync(detail);
        }

    }
}
