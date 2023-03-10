; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_rand_61b.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_rand_61b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @CWE127_Buffer_Underread__CWE839_rand_61b_badSource(i32 %data) #0 !dbg !12 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !16, metadata !DIExpression()), !dbg !17
  %call = call i32 @rand() #3, !dbg !18
  %and = and i32 %call, 1, !dbg !18
  %tobool = icmp ne i32 %and, 0, !dbg !18
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !18

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #3, !dbg !18
  %shl = shl i32 %call1, 30, !dbg !18
  %call2 = call i32 @rand() #3, !dbg !18
  %shl3 = shl i32 %call2, 15, !dbg !18
  %xor = xor i32 %shl, %shl3, !dbg !18
  %call4 = call i32 @rand() #3, !dbg !18
  %xor5 = xor i32 %xor, %call4, !dbg !18
  br label %cond.end, !dbg !18

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #3, !dbg !18
  %shl7 = shl i32 %call6, 30, !dbg !18
  %call8 = call i32 @rand() #3, !dbg !18
  %shl9 = shl i32 %call8, 15, !dbg !18
  %xor10 = xor i32 %shl7, %shl9, !dbg !18
  %call11 = call i32 @rand() #3, !dbg !18
  %xor12 = xor i32 %xor10, %call11, !dbg !18
  %sub = sub i32 0, %xor12, !dbg !18
  %sub13 = sub i32 %sub, 1, !dbg !18
  br label %cond.end, !dbg !18

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !18
  store i32 %cond, i32* %data.addr, align 4, !dbg !19
  %0 = load i32, i32* %data.addr, align 4, !dbg !20
  ret i32 %0, !dbg !21
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @CWE127_Buffer_Underread__CWE839_rand_61b_goodG2BSource(i32 %data) #0 !dbg !22 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !23, metadata !DIExpression()), !dbg !24
  store i32 7, i32* %data.addr, align 4, !dbg !25
  %0 = load i32, i32* %data.addr, align 4, !dbg !26
  ret i32 %0, !dbg !27
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @CWE127_Buffer_Underread__CWE839_rand_61b_goodB2GSource(i32 %data) #0 !dbg !28 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !29, metadata !DIExpression()), !dbg !30
  %call = call i32 @rand() #3, !dbg !31
  %and = and i32 %call, 1, !dbg !31
  %tobool = icmp ne i32 %and, 0, !dbg !31
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !31

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #3, !dbg !31
  %shl = shl i32 %call1, 30, !dbg !31
  %call2 = call i32 @rand() #3, !dbg !31
  %shl3 = shl i32 %call2, 15, !dbg !31
  %xor = xor i32 %shl, %shl3, !dbg !31
  %call4 = call i32 @rand() #3, !dbg !31
  %xor5 = xor i32 %xor, %call4, !dbg !31
  br label %cond.end, !dbg !31

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #3, !dbg !31
  %shl7 = shl i32 %call6, 30, !dbg !31
  %call8 = call i32 @rand() #3, !dbg !31
  %shl9 = shl i32 %call8, 15, !dbg !31
  %xor10 = xor i32 %shl7, %shl9, !dbg !31
  %call11 = call i32 @rand() #3, !dbg !31
  %xor12 = xor i32 %xor10, %call11, !dbg !31
  %sub = sub i32 0, %xor12, !dbg !31
  %sub13 = sub i32 %sub, 1, !dbg !31
  br label %cond.end, !dbg !31

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !31
  store i32 %cond, i32* %data.addr, align 4, !dbg !32
  %0 = load i32, i32* %data.addr, align 4, !dbg !33
  ret i32 %0, !dbg !34
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_rand_61b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"clang version 13.0.0"}
!12 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_rand_61b_badSource", scope: !13, file: !13, line: 22, type: !14, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_rand_61b.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{!4, !4}
!16 = !DILocalVariable(name: "data", arg: 1, scope: !12, file: !13, line: 22, type: !4)
!17 = !DILocation(line: 22, column: 60, scope: !12)
!18 = !DILocation(line: 25, column: 12, scope: !12)
!19 = !DILocation(line: 25, column: 10, scope: !12)
!20 = !DILocation(line: 26, column: 12, scope: !12)
!21 = !DILocation(line: 26, column: 5, scope: !12)
!22 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_rand_61b_goodG2BSource", scope: !13, file: !13, line: 34, type: !14, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!23 = !DILocalVariable(name: "data", arg: 1, scope: !22, file: !13, line: 34, type: !4)
!24 = !DILocation(line: 34, column: 64, scope: !22)
!25 = !DILocation(line: 38, column: 10, scope: !22)
!26 = !DILocation(line: 39, column: 12, scope: !22)
!27 = !DILocation(line: 39, column: 5, scope: !22)
!28 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_rand_61b_goodB2GSource", scope: !13, file: !13, line: 43, type: !14, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!29 = !DILocalVariable(name: "data", arg: 1, scope: !28, file: !13, line: 43, type: !4)
!30 = !DILocation(line: 43, column: 64, scope: !28)
!31 = !DILocation(line: 46, column: 12, scope: !28)
!32 = !DILocation(line: 46, column: 10, scope: !28)
!33 = !DILocation(line: 47, column: 12, scope: !28)
!34 = !DILocation(line: 47, column: 5, scope: !28)
