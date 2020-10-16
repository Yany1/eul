//
//  CpuMenuBlockView.swift
//  eul
//
//  Created by Gao Sun on 2020/9/20.
//  Copyright © 2020 Gao Sun. All rights reserved.
//

import SwiftUI

struct CpuMenuBlockView: View {
    @EnvironmentObject var cpuStore: CpuStore

    var body: some View {
        VStack(spacing: 4) {
            HStack {
                Text("CPU")
                    .menuSection()
                Spacer()
                cpuStore.usage.map {
                    ProgressBarView(percentage: CGFloat($0))
                }
            }
            cpuStore.usageCPU.map { usageCPU in
                Group {
                    SeparatorView()
                    HStack {
                        MiniSectionView(title: "cpu.system", value: String(format: "%.1f%%", usageCPU.system))
                        Spacer()
                        MiniSectionView(title: "cpu.user", value: String(format: "%.1f%%", usageCPU.user))
                        Spacer()
                        MiniSectionView(title: "cpu.nice", value: String(format: "%.1f%%", usageCPU.nice))
                        cpuStore.temp.map { temp in
                            Group {
                                Spacer()
                                MiniSectionView(title: "cpu.temperature", value: SmcControl.shared.formatTemp(temp))
                            }
                        }
                        cpuStore.gpuTemp.map { temp in
                            Group {
                                Spacer()
                                MiniSectionView(title: "gpu.temperature", value: SmcControl.shared.formatTemp(temp))
                            }
                        }
                    }
                }
            }
        }
        .menuBlock()
    }
}
