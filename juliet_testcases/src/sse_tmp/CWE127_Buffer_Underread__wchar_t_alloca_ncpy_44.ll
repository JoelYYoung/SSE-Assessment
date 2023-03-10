; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_44.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_44_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !21, metadata !DIExpression()), !dbg !25
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 400, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBuffer, align 8, !dbg !27
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !31
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !32
  store i32 0, i32* %arrayidx, align 4, !dbg !33
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !34
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !35
  store i32* %add.ptr, i32** %data, align 8, !dbg !36
  %5 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !37
  %6 = load i32*, i32** %data, align 8, !dbg !38
  call void %5(i32* %6), !dbg !37
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32* %data) #0 !dbg !40 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !43, metadata !DIExpression()), !dbg !48
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !49
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !50
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !51
  store i32 0, i32* %arrayidx, align 4, !dbg !52
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !53
  %0 = load i32*, i32** %data.addr, align 8, !dbg !54
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !55
  %call3 = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !56
  %call4 = call i32* @wcsncpy(i32* %arraydecay1, i32* %0, i64 %call3) #5, !dbg !57
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !58
  store i32 0, i32* %arrayidx5, align 4, !dbg !59
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !60
  call void @printWLine(i32* %arraydecay6), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_44_good() #0 !dbg !63 {
entry:
  call void @goodG2B(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* null) #5, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #5, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_44_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_44_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !86 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !89, metadata !DIExpression()), !dbg !90
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  %0 = alloca i8, i64 400, align 16, !dbg !93
  %1 = bitcast i8* %0 to i32*, !dbg !94
  store i32* %1, i32** %dataBuffer, align 8, !dbg !92
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !95
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !96
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !97
  store i32 0, i32* %arrayidx, align 4, !dbg !98
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !99
  store i32* %4, i32** %data, align 8, !dbg !100
  %5 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !101
  %6 = load i32*, i32** %data, align 8, !dbg !102
  call void %5(i32* %6), !dbg !101
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !104 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !107, metadata !DIExpression()), !dbg !109
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !110
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !111
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !112
  store i32 0, i32* %arrayidx, align 4, !dbg !113
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !114
  %0 = load i32*, i32** %data.addr, align 8, !dbg !115
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !116
  %call3 = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !117
  %call4 = call i32* @wcsncpy(i32* %arraydecay1, i32* %0, i64 %call3) #5, !dbg !118
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !119
  store i32 0, i32* %arrayidx5, align 4, !dbg !120
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !121
  call void @printWLine(i32* %arraydecay6), !dbg !122
  ret void, !dbg !123
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_44.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_ncpy_44_bad", scope: !16, file: !16, line: 37, type: !17, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_44.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 39, type: !4)
!20 = !DILocation(line: 39, column: 15, scope: !15)
!21 = !DILocalVariable(name: "funcPtr", scope: !15, file: !16, line: 41, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !4}
!25 = !DILocation(line: 41, column: 12, scope: !15)
!26 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 42, type: !4)
!27 = !DILocation(line: 42, column: 15, scope: !15)
!28 = !DILocation(line: 42, column: 39, scope: !15)
!29 = !DILocation(line: 42, column: 28, scope: !15)
!30 = !DILocation(line: 43, column: 13, scope: !15)
!31 = !DILocation(line: 43, column: 5, scope: !15)
!32 = !DILocation(line: 44, column: 5, scope: !15)
!33 = !DILocation(line: 44, column: 23, scope: !15)
!34 = !DILocation(line: 46, column: 12, scope: !15)
!35 = !DILocation(line: 46, column: 23, scope: !15)
!36 = !DILocation(line: 46, column: 10, scope: !15)
!37 = !DILocation(line: 48, column: 5, scope: !15)
!38 = !DILocation(line: 48, column: 13, scope: !15)
!39 = !DILocation(line: 49, column: 1, scope: !15)
!40 = distinct !DISubprogram(name: "badSink", scope: !16, file: !16, line: 23, type: !23, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DILocalVariable(name: "data", arg: 1, scope: !40, file: !16, line: 23, type: !4)
!42 = !DILocation(line: 23, column: 31, scope: !40)
!43 = !DILocalVariable(name: "dest", scope: !44, file: !16, line: 26, type: !45)
!44 = distinct !DILexicalBlock(scope: !40, file: !16, line: 25, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 100)
!48 = !DILocation(line: 26, column: 17, scope: !44)
!49 = !DILocation(line: 27, column: 17, scope: !44)
!50 = !DILocation(line: 27, column: 9, scope: !44)
!51 = !DILocation(line: 28, column: 9, scope: !44)
!52 = !DILocation(line: 28, column: 21, scope: !44)
!53 = !DILocation(line: 30, column: 17, scope: !44)
!54 = !DILocation(line: 30, column: 23, scope: !44)
!55 = !DILocation(line: 30, column: 36, scope: !44)
!56 = !DILocation(line: 30, column: 29, scope: !44)
!57 = !DILocation(line: 30, column: 9, scope: !44)
!58 = !DILocation(line: 32, column: 9, scope: !44)
!59 = !DILocation(line: 32, column: 21, scope: !44)
!60 = !DILocation(line: 33, column: 20, scope: !44)
!61 = !DILocation(line: 33, column: 9, scope: !44)
!62 = !DILocation(line: 35, column: 1, scope: !40)
!63 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_ncpy_44_good", scope: !16, file: !16, line: 82, type: !17, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 84, column: 5, scope: !63)
!65 = !DILocation(line: 85, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 96, type: !67, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!7, !7, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !16, line: 96, type: !7)
!73 = !DILocation(line: 96, column: 14, scope: !66)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !16, line: 96, type: !69)
!75 = !DILocation(line: 96, column: 27, scope: !66)
!76 = !DILocation(line: 99, column: 22, scope: !66)
!77 = !DILocation(line: 99, column: 12, scope: !66)
!78 = !DILocation(line: 99, column: 5, scope: !66)
!79 = !DILocation(line: 101, column: 5, scope: !66)
!80 = !DILocation(line: 102, column: 5, scope: !66)
!81 = !DILocation(line: 103, column: 5, scope: !66)
!82 = !DILocation(line: 106, column: 5, scope: !66)
!83 = !DILocation(line: 107, column: 5, scope: !66)
!84 = !DILocation(line: 108, column: 5, scope: !66)
!85 = !DILocation(line: 110, column: 5, scope: !66)
!86 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 70, type: !17, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "data", scope: !86, file: !16, line: 72, type: !4)
!88 = !DILocation(line: 72, column: 15, scope: !86)
!89 = !DILocalVariable(name: "funcPtr", scope: !86, file: !16, line: 73, type: !22)
!90 = !DILocation(line: 73, column: 12, scope: !86)
!91 = !DILocalVariable(name: "dataBuffer", scope: !86, file: !16, line: 74, type: !4)
!92 = !DILocation(line: 74, column: 15, scope: !86)
!93 = !DILocation(line: 74, column: 39, scope: !86)
!94 = !DILocation(line: 74, column: 28, scope: !86)
!95 = !DILocation(line: 75, column: 13, scope: !86)
!96 = !DILocation(line: 75, column: 5, scope: !86)
!97 = !DILocation(line: 76, column: 5, scope: !86)
!98 = !DILocation(line: 76, column: 23, scope: !86)
!99 = !DILocation(line: 78, column: 12, scope: !86)
!100 = !DILocation(line: 78, column: 10, scope: !86)
!101 = !DILocation(line: 79, column: 5, scope: !86)
!102 = !DILocation(line: 79, column: 13, scope: !86)
!103 = !DILocation(line: 80, column: 1, scope: !86)
!104 = distinct !DISubprogram(name: "goodG2BSink", scope: !16, file: !16, line: 56, type: !23, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", arg: 1, scope: !104, file: !16, line: 56, type: !4)
!106 = !DILocation(line: 56, column: 35, scope: !104)
!107 = !DILocalVariable(name: "dest", scope: !108, file: !16, line: 59, type: !45)
!108 = distinct !DILexicalBlock(scope: !104, file: !16, line: 58, column: 5)
!109 = !DILocation(line: 59, column: 17, scope: !108)
!110 = !DILocation(line: 60, column: 17, scope: !108)
!111 = !DILocation(line: 60, column: 9, scope: !108)
!112 = !DILocation(line: 61, column: 9, scope: !108)
!113 = !DILocation(line: 61, column: 21, scope: !108)
!114 = !DILocation(line: 63, column: 17, scope: !108)
!115 = !DILocation(line: 63, column: 23, scope: !108)
!116 = !DILocation(line: 63, column: 36, scope: !108)
!117 = !DILocation(line: 63, column: 29, scope: !108)
!118 = !DILocation(line: 63, column: 9, scope: !108)
!119 = !DILocation(line: 65, column: 9, scope: !108)
!120 = !DILocation(line: 65, column: 21, scope: !108)
!121 = !DILocation(line: 66, column: 20, scope: !108)
!122 = !DILocation(line: 66, column: 9, scope: !108)
!123 = !DILocation(line: 68, column: 1, scope: !104)
