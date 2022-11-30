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

let dummy0 : [TotalReportModel] = [TotalReportModel(num: "N번")]

let dummy1 : [ReportModel] = [
    ReportModel(image: "good", label: "N번 만족"),
    ReportModel(image: "bad", label: "N번 불만족"),
]

let dummy2 : [ReportModel] = [
    ReportModel(image: "dead", label: "무름 N번"),
    ReportModel(image: "happy", label: "적당함 N번"),
    ReportModel(image: "sad", label: "딱딱함 N번"),
]

let dummy3 : [ReportModel] = [
    ReportModel(image: "color1", label: "n번"),
    ReportModel(image: "color2", label: "n번"),
    ReportModel(image: "color3", label: "n번"),
    ReportModel(image: "color4", label: "n번"),
    ReportModel(image: "color5", label: "n번"),
]
