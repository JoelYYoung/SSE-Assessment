; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_cpy_05.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_cpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !12
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_cpy_05_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 400, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBuffer, align 8, !dbg !27
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !31
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !32
  store i32 0, i32* %arrayidx, align 4, !dbg !33
  %4 = load i32, i32* @staticTrue, align 4, !dbg !34
  %tobool = icmp ne i32 %4, 0, !dbg !34
  br i1 %tobool, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !37
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 -8, !dbg !39
  store i32* %add.ptr, i32** %data, align 8, !dbg !40
  br label %if.end, !dbg !41

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !42, metadata !DIExpression()), !dbg !47
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !48
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #4, !dbg !49
  %arrayidx2 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !50
  store i32 0, i32* %arrayidx2, align 4, !dbg !51
  %arraydecay3 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !52
  %6 = load i32*, i32** %data, align 8, !dbg !53
  %call4 = call i32* @wcscpy(i32* %arraydecay3, i32* %6) #4, !dbg !54
  %arraydecay5 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !55
  call void @printWLine(i32* %arraydecay5), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_cpy_05_good() #0 !dbg !58 {
entry:
  call void @goodG2B1(), !dbg !59
  call void @goodG2B2(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #4, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #4, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE127_Buffer_Underread__wchar_t_alloca_cpy_05_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE127_Buffer_Underread__wchar_t_alloca_cpy_05_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !82 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %0 = alloca i8, i64 400, align 16, !dbg !87
  %1 = bitcast i8* %0 to i32*, !dbg !88
  store i32* %1, i32** %dataBuffer, align 8, !dbg !86
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !89
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !90
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !91
  store i32 0, i32* %arrayidx, align 4, !dbg !92
  %4 = load i32, i32* @staticFalse, align 4, !dbg !93
  %tobool = icmp ne i32 %4, 0, !dbg !93
  br i1 %tobool, label %if.then, label %if.else, !dbg !95

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !96
  br label %if.end, !dbg !98

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !99
  store i32* %5, i32** %data, align 8, !dbg !101
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !102, metadata !DIExpression()), !dbg !104
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !105
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #4, !dbg !106
  %arrayidx2 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !107
  store i32 0, i32* %arrayidx2, align 4, !dbg !108
  %arraydecay3 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !109
  %6 = load i32*, i32** %data, align 8, !dbg !110
  %call4 = call i32* @wcscpy(i32* %arraydecay3, i32* %6) #4, !dbg !111
  %arraydecay5 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !112
  call void @printWLine(i32* %arraydecay5), !dbg !113
  ret void, !dbg !114
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !115 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  %0 = alloca i8, i64 400, align 16, !dbg !120
  %1 = bitcast i8* %0 to i32*, !dbg !121
  store i32* %1, i32** %dataBuffer, align 8, !dbg !119
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !122
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !123
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !124
  store i32 0, i32* %arrayidx, align 4, !dbg !125
  %4 = load i32, i32* @staticTrue, align 4, !dbg !126
  %tobool = icmp ne i32 %4, 0, !dbg !126
  br i1 %tobool, label %if.then, label %if.end, !dbg !128

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !129
  store i32* %5, i32** %data, align 8, !dbg !131
  br label %if.end, !dbg !132

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !133, metadata !DIExpression()), !dbg !135
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !136
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #4, !dbg !137
  %arrayidx2 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !138
  store i32 0, i32* %arrayidx2, align 4, !dbg !139
  %arraydecay3 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !140
  %6 = load i32*, i32** %data, align 8, !dbg !141
  %call4 = call i32* @wcscpy(i32* %arraydecay3, i32* %6) #4, !dbg !142
  %arraydecay5 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !143
  call void @printWLine(i32* %arraydecay5), !dbg !144
  ret void, !dbg !145
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !14, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_cpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !14, line: 26, type: !9, isLocal: true, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_cpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_cpy_05_bad", scope: !14, file: !14, line: 30, type: !22, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !14, line: 32, type: !6)
!25 = !DILocation(line: 32, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBuffer", scope: !21, file: !14, line: 33, type: !6)
!27 = !DILocation(line: 33, column: 15, scope: !21)
!28 = !DILocation(line: 33, column: 39, scope: !21)
!29 = !DILocation(line: 33, column: 28, scope: !21)
!30 = !DILocation(line: 34, column: 13, scope: !21)
!31 = !DILocation(line: 34, column: 5, scope: !21)
!32 = !DILocation(line: 35, column: 5, scope: !21)
!33 = !DILocation(line: 35, column: 23, scope: !21)
!34 = !DILocation(line: 36, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !21, file: !14, line: 36, column: 8)
!36 = !DILocation(line: 36, column: 8, scope: !21)
!37 = !DILocation(line: 39, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !14, line: 37, column: 5)
!39 = !DILocation(line: 39, column: 27, scope: !38)
!40 = !DILocation(line: 39, column: 14, scope: !38)
!41 = !DILocation(line: 40, column: 5, scope: !38)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !14, line: 42, type: !44)
!43 = distinct !DILexicalBlock(scope: !21, file: !14, line: 41, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 6400, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 200)
!47 = !DILocation(line: 42, column: 17, scope: !43)
!48 = !DILocation(line: 43, column: 17, scope: !43)
!49 = !DILocation(line: 43, column: 9, scope: !43)
!50 = !DILocation(line: 44, column: 9, scope: !43)
!51 = !DILocation(line: 44, column: 23, scope: !43)
!52 = !DILocation(line: 46, column: 16, scope: !43)
!53 = !DILocation(line: 46, column: 22, scope: !43)
!54 = !DILocation(line: 46, column: 9, scope: !43)
!55 = !DILocation(line: 47, column: 20, scope: !43)
!56 = !DILocation(line: 47, column: 9, scope: !43)
!57 = !DILocation(line: 49, column: 1, scope: !21)
!58 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_cpy_05_good", scope: !14, file: !14, line: 104, type: !22, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DILocation(line: 106, column: 5, scope: !58)
!60 = !DILocation(line: 107, column: 5, scope: !58)
!61 = !DILocation(line: 108, column: 1, scope: !58)
!62 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 120, type: !63, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!63 = !DISubroutineType(types: !64)
!64 = !{!9, !9, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !14, line: 120, type: !9)
!69 = !DILocation(line: 120, column: 14, scope: !62)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !14, line: 120, type: !65)
!71 = !DILocation(line: 120, column: 27, scope: !62)
!72 = !DILocation(line: 123, column: 22, scope: !62)
!73 = !DILocation(line: 123, column: 12, scope: !62)
!74 = !DILocation(line: 123, column: 5, scope: !62)
!75 = !DILocation(line: 125, column: 5, scope: !62)
!76 = !DILocation(line: 126, column: 5, scope: !62)
!77 = !DILocation(line: 127, column: 5, scope: !62)
!78 = !DILocation(line: 130, column: 5, scope: !62)
!79 = !DILocation(line: 131, column: 5, scope: !62)
!80 = !DILocation(line: 132, column: 5, scope: !62)
!81 = !DILocation(line: 134, column: 5, scope: !62)
!82 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 56, type: !22, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!83 = !DILocalVariable(name: "data", scope: !82, file: !14, line: 58, type: !6)
!84 = !DILocation(line: 58, column: 15, scope: !82)
!85 = !DILocalVariable(name: "dataBuffer", scope: !82, file: !14, line: 59, type: !6)
!86 = !DILocation(line: 59, column: 15, scope: !82)
!87 = !DILocation(line: 59, column: 39, scope: !82)
!88 = !DILocation(line: 59, column: 28, scope: !82)
!89 = !DILocation(line: 60, column: 13, scope: !82)
!90 = !DILocation(line: 60, column: 5, scope: !82)
!91 = !DILocation(line: 61, column: 5, scope: !82)
!92 = !DILocation(line: 61, column: 23, scope: !82)
!93 = !DILocation(line: 62, column: 8, scope: !94)
!94 = distinct !DILexicalBlock(scope: !82, file: !14, line: 62, column: 8)
!95 = !DILocation(line: 62, column: 8, scope: !82)
!96 = !DILocation(line: 65, column: 9, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !14, line: 63, column: 5)
!98 = !DILocation(line: 66, column: 5, scope: !97)
!99 = !DILocation(line: 70, column: 16, scope: !100)
!100 = distinct !DILexicalBlock(scope: !94, file: !14, line: 68, column: 5)
!101 = !DILocation(line: 70, column: 14, scope: !100)
!102 = !DILocalVariable(name: "dest", scope: !103, file: !14, line: 73, type: !44)
!103 = distinct !DILexicalBlock(scope: !82, file: !14, line: 72, column: 5)
!104 = !DILocation(line: 73, column: 17, scope: !103)
!105 = !DILocation(line: 74, column: 17, scope: !103)
!106 = !DILocation(line: 74, column: 9, scope: !103)
!107 = !DILocation(line: 75, column: 9, scope: !103)
!108 = !DILocation(line: 75, column: 23, scope: !103)
!109 = !DILocation(line: 77, column: 16, scope: !103)
!110 = !DILocation(line: 77, column: 22, scope: !103)
!111 = !DILocation(line: 77, column: 9, scope: !103)
!112 = !DILocation(line: 78, column: 20, scope: !103)
!113 = !DILocation(line: 78, column: 9, scope: !103)
!114 = !DILocation(line: 80, column: 1, scope: !82)
!115 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 83, type: !22, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!116 = !DILocalVariable(name: "data", scope: !115, file: !14, line: 85, type: !6)
!117 = !DILocation(line: 85, column: 15, scope: !115)
!118 = !DILocalVariable(name: "dataBuffer", scope: !115, file: !14, line: 86, type: !6)
!119 = !DILocation(line: 86, column: 15, scope: !115)
!120 = !DILocation(line: 86, column: 39, scope: !115)
!121 = !DILocation(line: 86, column: 28, scope: !115)
!122 = !DILocation(line: 87, column: 13, scope: !115)
!123 = !DILocation(line: 87, column: 5, scope: !115)
!124 = !DILocation(line: 88, column: 5, scope: !115)
!125 = !DILocation(line: 88, column: 23, scope: !115)
!126 = !DILocation(line: 89, column: 8, scope: !127)
!127 = distinct !DILexicalBlock(scope: !115, file: !14, line: 89, column: 8)
!128 = !DILocation(line: 89, column: 8, scope: !115)
!129 = !DILocation(line: 92, column: 16, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !14, line: 90, column: 5)
!131 = !DILocation(line: 92, column: 14, scope: !130)
!132 = !DILocation(line: 93, column: 5, scope: !130)
!133 = !DILocalVariable(name: "dest", scope: !134, file: !14, line: 95, type: !44)
!134 = distinct !DILexicalBlock(scope: !115, file: !14, line: 94, column: 5)
!135 = !DILocation(line: 95, column: 17, scope: !134)
!136 = !DILocation(line: 96, column: 17, scope: !134)
!137 = !DILocation(line: 96, column: 9, scope: !134)
!138 = !DILocation(line: 97, column: 9, scope: !134)
!139 = !DILocation(line: 97, column: 23, scope: !134)
!140 = !DILocation(line: 99, column: 16, scope: !134)
!141 = !DILocation(line: 99, column: 22, scope: !134)
!142 = !DILocation(line: 99, column: 9, scope: !134)
!143 = !DILocation(line: 100, column: 20, scope: !134)
!144 = !DILocation(line: 100, column: 9, scope: !134)
!145 = !DILocation(line: 102, column: 1, scope: !115)
