//
//  ReportModel.swift
//  MyPooDiary
//
//  Created by 김인영 on 2022/11/20.
//

import Foundation

struct ReportModel {
    var image: String
    var label: String
}

let dummy1 : [ReportModel] = [
    ReportModel(image: "good", label: "N번 만족"),
    ReportModel(image: "bad", label: "N번 불만족"),
]

let dummy2 : [ReportModel] = [
    ReportModel(image: "Group 2927", label: "무름 N번"),
    ReportModel(image: "Group 2928", label: "적당함 N번"),
    ReportModel(image: "Group 2929", label: "딱딱함 N번"),
]

let dummy3 : [ReportModel] = [
    ReportModel(image: "Ellipse 43", label: "n번"),
    ReportModel(image: "Ellipse 44", label: "n번"),
    ReportModel(image: "Ellipse 45", label: "n번"),
    ReportModel(image: "Ellipse 46", label: "n번"),
    ReportModel(image: "Ellipse 47", label: "n번"),
]
