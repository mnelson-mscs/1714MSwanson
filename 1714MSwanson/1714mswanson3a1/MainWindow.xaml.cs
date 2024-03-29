﻿using _1714mswanson2g;
using System;
using System.Collections.Generic;
using System.Data.Entity;
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

namespace _1714mswanson3a1
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {

            System.Windows.Data.CollectionViewSource buildingViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("buildingViewSource")));
            // Load data by setting the CollectionViewSource.Source property:
            PropertyManager2ModelContainer dbContext = new PropertyManager2ModelContainer();
            dbContext.Buildings.Load();
            buildingViewSource.Source = dbContext.Buildings.Local;
        }
    }
}
