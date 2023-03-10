; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_cpy_07.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_cpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_cpy_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !29
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !30
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  %0 = load i32, i32* @staticFive, align 4, !dbg !33
  %cmp = icmp eq i32 %0, 5, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !37
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !39
  store i32* %add.ptr, i32** %data, align 8, !dbg !40
  br label %if.end, !dbg !41

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !42, metadata !DIExpression()), !dbg !44
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !45
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !46
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !47
  store i32 0, i32* %arrayidx4, align 4, !dbg !48
  %1 = load i32*, i32** %data, align 8, !dbg !49
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !50
  %call6 = call i32* @wcscpy(i32* %1, i32* %arraydecay5) #4, !dbg !51
  %2 = load i32*, i32** %data, align 8, !dbg !52
  call void @printWLine(i32* %2), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_cpy_07_good() #0 !dbg !55 {
entry:
  call void @goodG2B1(), !dbg !56
  call void @goodG2B2(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #4, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #4, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_cpy_07_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_cpy_07_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !79 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !84
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !85
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !86
  store i32 0, i32* %arrayidx, align 4, !dbg !87
  %0 = load i32, i32* @staticFive, align 4, !dbg !88
  %cmp = icmp ne i32 %0, 5, !dbg !90
  br i1 %cmp, label %if.then, label %if.else, !dbg !91

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !92
  br label %if.end, !dbg !94

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !95
  store i32* %arraydecay1, i32** %data, align 8, !dbg !97
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !98, metadata !DIExpression()), !dbg !100
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !101
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !102
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !103
  store i32 0, i32* %arrayidx4, align 4, !dbg !104
  %1 = load i32*, i32** %data, align 8, !dbg !105
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !106
  %call6 = call i32* @wcscpy(i32* %1, i32* %arraydecay5) #4, !dbg !107
  %2 = load i32*, i32** %data, align 8, !dbg !108
  call void @printWLine(i32* %2), !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !111 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !116
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !117
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !118
  store i32 0, i32* %arrayidx, align 4, !dbg !119
  %0 = load i32, i32* @staticFive, align 4, !dbg !120
  %cmp = icmp eq i32 %0, 5, !dbg !122
  br i1 %cmp, label %if.then, label %if.end, !dbg !123

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !124
  store i32* %arraydecay1, i32** %data, align 8, !dbg !126
  br label %if.end, !dbg !127

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !128, metadata !DIExpression()), !dbg !130
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !131
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !132
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !133
  store i32 0, i32* %arrayidx4, align 4, !dbg !134
  %1 = load i32*, i32** %data, align 8, !dbg !135
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !136
  %call6 = call i32* @wcscpy(i32* %1, i32* %arraydecay5) #4, !dbg !137
  %2 = load i32*, i32** %data, align 8, !dbg !138
  call void @printWLine(i32* %2), !dbg !139
  ret void, !dbg !140
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_cpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_cpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_cpy_07_bad", scope: !8, file: !8, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 31, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !22, line: 74, baseType: !9)
!22 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!23 = !DILocation(line: 31, column: 15, scope: !16)
!24 = !DILocalVariable(name: "dataBuffer", scope: !16, file: !8, line: 32, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 32, column: 13, scope: !16)
!29 = !DILocation(line: 33, column: 13, scope: !16)
!30 = !DILocation(line: 33, column: 5, scope: !16)
!31 = !DILocation(line: 34, column: 5, scope: !16)
!32 = !DILocation(line: 34, column: 23, scope: !16)
!33 = !DILocation(line: 35, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !16, file: !8, line: 35, column: 8)
!35 = !DILocation(line: 35, column: 18, scope: !34)
!36 = !DILocation(line: 35, column: 8, scope: !16)
!37 = !DILocation(line: 38, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !8, line: 36, column: 5)
!39 = !DILocation(line: 38, column: 27, scope: !38)
!40 = !DILocation(line: 38, column: 14, scope: !38)
!41 = !DILocation(line: 39, column: 5, scope: !38)
!42 = !DILocalVariable(name: "source", scope: !43, file: !8, line: 41, type: !25)
!43 = distinct !DILexicalBlock(scope: !16, file: !8, line: 40, column: 5)
!44 = !DILocation(line: 41, column: 17, scope: !43)
!45 = !DILocation(line: 42, column: 17, scope: !43)
!46 = !DILocation(line: 42, column: 9, scope: !43)
!47 = !DILocation(line: 43, column: 9, scope: !43)
!48 = !DILocation(line: 43, column: 23, scope: !43)
!49 = !DILocation(line: 45, column: 16, scope: !43)
!50 = !DILocation(line: 45, column: 22, scope: !43)
!51 = !DILocation(line: 45, column: 9, scope: !43)
!52 = !DILocation(line: 46, column: 20, scope: !43)
!53 = !DILocation(line: 46, column: 9, scope: !43)
!54 = !DILocation(line: 48, column: 1, scope: !16)
!55 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_cpy_07_good", scope: !8, file: !8, line: 103, type: !17, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DILocation(line: 105, column: 5, scope: !55)
!57 = !DILocation(line: 106, column: 5, scope: !55)
!58 = !DILocation(line: 107, column: 1, scope: !55)
!59 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 119, type: !60, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DISubroutineType(types: !61)
!61 = !{!9, !9, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !8, line: 119, type: !9)
!66 = !DILocation(line: 119, column: 14, scope: !59)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !8, line: 119, type: !62)
!68 = !DILocation(line: 119, column: 27, scope: !59)
!69 = !DILocation(line: 122, column: 22, scope: !59)
!70 = !DILocation(line: 122, column: 12, scope: !59)
!71 = !DILocation(line: 122, column: 5, scope: !59)
!72 = !DILocation(line: 124, column: 5, scope: !59)
!73 = !DILocation(line: 125, column: 5, scope: !59)
!74 = !DILocation(line: 126, column: 5, scope: !59)
!75 = !DILocation(line: 129, column: 5, scope: !59)
!76 = !DILocation(line: 130, column: 5, scope: !59)
!77 = !DILocation(line: 131, column: 5, scope: !59)
!78 = !DILocation(line: 133, column: 5, scope: !59)
!79 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 55, type: !17, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DILocalVariable(name: "data", scope: !79, file: !8, line: 57, type: !20)
!81 = !DILocation(line: 57, column: 15, scope: !79)
!82 = !DILocalVariable(name: "dataBuffer", scope: !79, file: !8, line: 58, type: !25)
!83 = !DILocation(line: 58, column: 13, scope: !79)
!84 = !DILocation(line: 59, column: 13, scope: !79)
!85 = !DILocation(line: 59, column: 5, scope: !79)
!86 = !DILocation(line: 60, column: 5, scope: !79)
!87 = !DILocation(line: 60, column: 23, scope: !79)
!88 = !DILocation(line: 61, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !79, file: !8, line: 61, column: 8)
!90 = !DILocation(line: 61, column: 18, scope: !89)
!91 = !DILocation(line: 61, column: 8, scope: !79)
!92 = !DILocation(line: 64, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !8, line: 62, column: 5)
!94 = !DILocation(line: 65, column: 5, scope: !93)
!95 = !DILocation(line: 69, column: 16, scope: !96)
!96 = distinct !DILexicalBlock(scope: !89, file: !8, line: 67, column: 5)
!97 = !DILocation(line: 69, column: 14, scope: !96)
!98 = !DILocalVariable(name: "source", scope: !99, file: !8, line: 72, type: !25)
!99 = distinct !DILexicalBlock(scope: !79, file: !8, line: 71, column: 5)
!100 = !DILocation(line: 72, column: 17, scope: !99)
!101 = !DILocation(line: 73, column: 17, scope: !99)
!102 = !DILocation(line: 73, column: 9, scope: !99)
!103 = !DILocation(line: 74, column: 9, scope: !99)
!104 = !DILocation(line: 74, column: 23, scope: !99)
!105 = !DILocation(line: 76, column: 16, scope: !99)
!106 = !DILocation(line: 76, column: 22, scope: !99)
!107 = !DILocation(line: 76, column: 9, scope: !99)
!108 = !DILocation(line: 77, column: 20, scope: !99)
!109 = !DILocation(line: 77, column: 9, scope: !99)
!110 = !DILocation(line: 79, column: 1, scope: !79)
!111 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 82, type: !17, scopeLine: 83, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!112 = !DILocalVariable(name: "data", scope: !111, file: !8, line: 84, type: !20)
!113 = !DILocation(line: 84, column: 15, scope: !111)
!114 = !DILocalVariable(name: "dataBuffer", scope: !111, file: !8, line: 85, type: !25)
!115 = !DILocation(line: 85, column: 13, scope: !111)
!116 = !DILocation(line: 86, column: 13, scope: !111)
!117 = !DILocation(line: 86, column: 5, scope: !111)
!118 = !DILocation(line: 87, column: 5, scope: !111)
!119 = !DILocation(line: 87, column: 23, scope: !111)
!120 = !DILocation(line: 88, column: 8, scope: !121)
!121 = distinct !DILexicalBlock(scope: !111, file: !8, line: 88, column: 8)
!122 = !DILocation(line: 88, column: 18, scope: !121)
!123 = !DILocation(line: 88, column: 8, scope: !111)
!124 = !DILocation(line: 91, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !8, line: 89, column: 5)
!126 = !DILocation(line: 91, column: 14, scope: !125)
!127 = !DILocation(line: 92, column: 5, scope: !125)
!128 = !DILocalVariable(name: "source", scope: !129, file: !8, line: 94, type: !25)
!129 = distinct !DILexicalBlock(scope: !111, file: !8, line: 93, column: 5)
!130 = !DILocation(line: 94, column: 17, scope: !129)
!131 = !DILocation(line: 95, column: 17, scope: !129)
!132 = !DILocation(line: 95, column: 9, scope: !129)
!133 = !DILocation(line: 96, column: 9, scope: !129)
!134 = !DILocation(line: 96, column: 23, scope: !129)
!135 = !DILocation(line: 98, column: 16, scope: !129)
!136 = !DILocation(line: 98, column: 22, scope: !129)
!137 = !DILocation(line: 98, column: 9, scope: !129)
!138 = !DILocation(line: 99, column: 20, scope: !129)
!139 = !DILocation(line: 99, column: 9, scope: !129)
!140 = !DILocation(line: 101, column: 1, scope: !111)
