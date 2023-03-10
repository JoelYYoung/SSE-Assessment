; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_cpy_05.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_cpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !8
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_cpy_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !31
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !32
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  %0 = load i32, i32* @staticTrue, align 4, !dbg !35
  %tobool = icmp ne i32 %0, 0, !dbg !35
  br i1 %tobool, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !38
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !40
  store i32* %add.ptr, i32** %data, align 8, !dbg !41
  br label %if.end, !dbg !42

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !43, metadata !DIExpression()), !dbg !45
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !46
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !47
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !48
  store i32 0, i32* %arrayidx4, align 4, !dbg !49
  %1 = load i32*, i32** %data, align 8, !dbg !50
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !51
  %call6 = call i32* @wcscpy(i32* %1, i32* %arraydecay5) #4, !dbg !52
  %2 = load i32*, i32** %data, align 8, !dbg !53
  call void @printWLine(i32* %2), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_cpy_05_good() #0 !dbg !56 {
entry:
  call void @goodG2B1(), !dbg !57
  call void @goodG2B2(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #4, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #4, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_cpy_05_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_cpy_05_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !80 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !85
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !86
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !87
  store i32 0, i32* %arrayidx, align 4, !dbg !88
  %0 = load i32, i32* @staticFalse, align 4, !dbg !89
  %tobool = icmp ne i32 %0, 0, !dbg !89
  br i1 %tobool, label %if.then, label %if.else, !dbg !91

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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !120
  %tobool = icmp ne i32 %0, 0, !dbg !120
  br i1 %tobool, label %if.then, label %if.end, !dbg !122

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !123
  store i32* %arraydecay1, i32** %data, align 8, !dbg !125
  br label %if.end, !dbg !126

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !127, metadata !DIExpression()), !dbg !129
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !130
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !131
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !132
  store i32 0, i32* %arrayidx4, align 4, !dbg !133
  %1 = load i32*, i32** %data, align 8, !dbg !134
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !135
  %call6 = call i32* @wcscpy(i32* %1, i32* %arraydecay5) #4, !dbg !136
  %2 = load i32*, i32** %data, align 8, !dbg !137
  call void @printWLine(i32* %2), !dbg !138
  ret void, !dbg !139
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_cpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 26, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_cpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_cpy_05_bad", scope: !10, file: !10, line: 30, type: !19, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !24, line: 74, baseType: !11)
!24 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!25 = !DILocation(line: 32, column: 15, scope: !18)
!26 = !DILocalVariable(name: "dataBuffer", scope: !18, file: !10, line: 33, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 33, column: 13, scope: !18)
!31 = !DILocation(line: 34, column: 13, scope: !18)
!32 = !DILocation(line: 34, column: 5, scope: !18)
!33 = !DILocation(line: 35, column: 5, scope: !18)
!34 = !DILocation(line: 35, column: 23, scope: !18)
!35 = !DILocation(line: 36, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !18, file: !10, line: 36, column: 8)
!37 = !DILocation(line: 36, column: 8, scope: !18)
!38 = !DILocation(line: 39, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !10, line: 37, column: 5)
!40 = !DILocation(line: 39, column: 27, scope: !39)
!41 = !DILocation(line: 39, column: 14, scope: !39)
!42 = !DILocation(line: 40, column: 5, scope: !39)
!43 = !DILocalVariable(name: "source", scope: !44, file: !10, line: 42, type: !27)
!44 = distinct !DILexicalBlock(scope: !18, file: !10, line: 41, column: 5)
!45 = !DILocation(line: 42, column: 17, scope: !44)
!46 = !DILocation(line: 43, column: 17, scope: !44)
!47 = !DILocation(line: 43, column: 9, scope: !44)
!48 = !DILocation(line: 44, column: 9, scope: !44)
!49 = !DILocation(line: 44, column: 23, scope: !44)
!50 = !DILocation(line: 46, column: 16, scope: !44)
!51 = !DILocation(line: 46, column: 22, scope: !44)
!52 = !DILocation(line: 46, column: 9, scope: !44)
!53 = !DILocation(line: 47, column: 20, scope: !44)
!54 = !DILocation(line: 47, column: 9, scope: !44)
!55 = !DILocation(line: 49, column: 1, scope: !18)
!56 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_cpy_05_good", scope: !10, file: !10, line: 104, type: !19, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DILocation(line: 106, column: 5, scope: !56)
!58 = !DILocation(line: 107, column: 5, scope: !56)
!59 = !DILocation(line: 108, column: 1, scope: !56)
!60 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 120, type: !61, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DISubroutineType(types: !62)
!62 = !{!11, !11, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !10, line: 120, type: !11)
!67 = !DILocation(line: 120, column: 14, scope: !60)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !10, line: 120, type: !63)
!69 = !DILocation(line: 120, column: 27, scope: !60)
!70 = !DILocation(line: 123, column: 22, scope: !60)
!71 = !DILocation(line: 123, column: 12, scope: !60)
!72 = !DILocation(line: 123, column: 5, scope: !60)
!73 = !DILocation(line: 125, column: 5, scope: !60)
!74 = !DILocation(line: 126, column: 5, scope: !60)
!75 = !DILocation(line: 127, column: 5, scope: !60)
!76 = !DILocation(line: 130, column: 5, scope: !60)
!77 = !DILocation(line: 131, column: 5, scope: !60)
!78 = !DILocation(line: 132, column: 5, scope: !60)
!79 = !DILocation(line: 134, column: 5, scope: !60)
!80 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 56, type: !19, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DILocalVariable(name: "data", scope: !80, file: !10, line: 58, type: !22)
!82 = !DILocation(line: 58, column: 15, scope: !80)
!83 = !DILocalVariable(name: "dataBuffer", scope: !80, file: !10, line: 59, type: !27)
!84 = !DILocation(line: 59, column: 13, scope: !80)
!85 = !DILocation(line: 60, column: 13, scope: !80)
!86 = !DILocation(line: 60, column: 5, scope: !80)
!87 = !DILocation(line: 61, column: 5, scope: !80)
!88 = !DILocation(line: 61, column: 23, scope: !80)
!89 = !DILocation(line: 62, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !80, file: !10, line: 62, column: 8)
!91 = !DILocation(line: 62, column: 8, scope: !80)
!92 = !DILocation(line: 65, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !10, line: 63, column: 5)
!94 = !DILocation(line: 66, column: 5, scope: !93)
!95 = !DILocation(line: 70, column: 16, scope: !96)
!96 = distinct !DILexicalBlock(scope: !90, file: !10, line: 68, column: 5)
!97 = !DILocation(line: 70, column: 14, scope: !96)
!98 = !DILocalVariable(name: "source", scope: !99, file: !10, line: 73, type: !27)
!99 = distinct !DILexicalBlock(scope: !80, file: !10, line: 72, column: 5)
!100 = !DILocation(line: 73, column: 17, scope: !99)
!101 = !DILocation(line: 74, column: 17, scope: !99)
!102 = !DILocation(line: 74, column: 9, scope: !99)
!103 = !DILocation(line: 75, column: 9, scope: !99)
!104 = !DILocation(line: 75, column: 23, scope: !99)
!105 = !DILocation(line: 77, column: 16, scope: !99)
!106 = !DILocation(line: 77, column: 22, scope: !99)
!107 = !DILocation(line: 77, column: 9, scope: !99)
!108 = !DILocation(line: 78, column: 20, scope: !99)
!109 = !DILocation(line: 78, column: 9, scope: !99)
!110 = !DILocation(line: 80, column: 1, scope: !80)
!111 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 83, type: !19, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!112 = !DILocalVariable(name: "data", scope: !111, file: !10, line: 85, type: !22)
!113 = !DILocation(line: 85, column: 15, scope: !111)
!114 = !DILocalVariable(name: "dataBuffer", scope: !111, file: !10, line: 86, type: !27)
!115 = !DILocation(line: 86, column: 13, scope: !111)
!116 = !DILocation(line: 87, column: 13, scope: !111)
!117 = !DILocation(line: 87, column: 5, scope: !111)
!118 = !DILocation(line: 88, column: 5, scope: !111)
!119 = !DILocation(line: 88, column: 23, scope: !111)
!120 = !DILocation(line: 89, column: 8, scope: !121)
!121 = distinct !DILexicalBlock(scope: !111, file: !10, line: 89, column: 8)
!122 = !DILocation(line: 89, column: 8, scope: !111)
!123 = !DILocation(line: 92, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !10, line: 90, column: 5)
!125 = !DILocation(line: 92, column: 14, scope: !124)
!126 = !DILocation(line: 93, column: 5, scope: !124)
!127 = !DILocalVariable(name: "source", scope: !128, file: !10, line: 95, type: !27)
!128 = distinct !DILexicalBlock(scope: !111, file: !10, line: 94, column: 5)
!129 = !DILocation(line: 95, column: 17, scope: !128)
!130 = !DILocation(line: 96, column: 17, scope: !128)
!131 = !DILocation(line: 96, column: 9, scope: !128)
!132 = !DILocation(line: 97, column: 9, scope: !128)
!133 = !DILocation(line: 97, column: 23, scope: !128)
!134 = !DILocation(line: 99, column: 16, scope: !128)
!135 = !DILocation(line: 99, column: 22, scope: !128)
!136 = !DILocation(line: 99, column: 9, scope: !128)
!137 = !DILocation(line: 100, column: 20, scope: !128)
!138 = !DILocation(line: 100, column: 9, scope: !128)
!139 = !DILocation(line: 102, column: 1, scope: !111)
