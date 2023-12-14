#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}


void MainWindow::on_plusButton_clicked()
{
    int a = ui->aNumber->text().toInt();
    int b = ui->bNumber->text().toInt();
    QString result;
    result.setNum((a + b));
    ui->resultNumber->setText(result);
}


void MainWindow::on_multiplyButton_clicked()
{
    int a = ui->aNumber->text().toInt();
    int b = ui->bNumber->text().toInt();
    QString result;
    result.setNum((a * b));
    ui->resultNumber->setText(result);
}


void MainWindow::on_minusButton_clicked()
{
    int a = ui->aNumber->text().toInt();
    int b = ui->bNumber->text().toInt();
    QString result;
    result.setNum((a - b));
    ui->resultNumber->setText(result);
}


void MainWindow::on_divideButton_clicked()
{
    int a = ui->aNumber->text().toInt();
    int b = ui->bNumber->text().toInt();
    QString result;
    result.setNum((a / b));
    ui->resultNumber->setText(result);
}

