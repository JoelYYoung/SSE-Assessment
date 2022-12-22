; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_05.c"
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  %0 = load i32, i32* @staticTrue, align 4, !dbg !36
  %tobool = icmp ne i32 %0, 0, !dbg !36
  br i1 %tobool, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  store i32* %arraydecay, i32** %data, align 8, !dbg !41
  %1 = load i32*, i32** %data, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  br label %if.end, !dbg !44

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !45, metadata !DIExpression()), !dbg !47
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !48
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !49
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !50
  store i32 0, i32* %arrayidx2, align 4, !dbg !51
  %2 = load i32*, i32** %data, align 8, !dbg !52
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !53
  %call4 = call i32* @wcsncpy(i32* %2, i32* %arraydecay3, i64 99) #4, !dbg !54
  %3 = load i32*, i32** %data, align 8, !dbg !55
  %arrayidx5 = getelementptr inbounds i32, i32* %3, i64 99, !dbg !55
  store i32 0, i32* %arrayidx5, align 4, !dbg !56
  %4 = load i32*, i32** %data, align 8, !dbg !57
  call void @printWLine(i32* %4), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_05_good() #0 !dbg !60 {
entry:
  call void @goodG2B1(), !dbg !61
  call void @goodG2B2(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* null) #4, !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 %conv) #4, !dbg !76
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_05_good(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_05_bad(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !84 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  %0 = load i32, i32* @staticFalse, align 4, !dbg !91
  %tobool = icmp ne i32 %0, 0, !dbg !91
  br i1 %tobool, label %if.then, label %if.else, !dbg !93

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !94
  br label %if.end, !dbg !96

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !97
  store i32* %arraydecay, i32** %data, align 8, !dbg !99
  %1 = load i32*, i32** %data, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !100
  store i32 0, i32* %arrayidx, align 4, !dbg !101
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !102, metadata !DIExpression()), !dbg !104
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !105
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !106
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !107
  store i32 0, i32* %arrayidx2, align 4, !dbg !108
  %2 = load i32*, i32** %data, align 8, !dbg !109
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !110
  %call4 = call i32* @wcsncpy(i32* %2, i32* %arraydecay3, i64 99) #4, !dbg !111
  %3 = load i32*, i32** %data, align 8, !dbg !112
  %arrayidx5 = getelementptr inbounds i32, i32* %3, i64 99, !dbg !112
  store i32 0, i32* %arrayidx5, align 4, !dbg !113
  %4 = load i32*, i32** %data, align 8, !dbg !114
  call void @printWLine(i32* %4), !dbg !115
  ret void, !dbg !116
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !117 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !122, metadata !DIExpression()), !dbg !123
  %0 = load i32, i32* @staticTrue, align 4, !dbg !124
  %tobool = icmp ne i32 %0, 0, !dbg !124
  br i1 %tobool, label %if.then, label %if.end, !dbg !126

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !127
  store i32* %arraydecay, i32** %data, align 8, !dbg !129
  %1 = load i32*, i32** %data, align 8, !dbg !130
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !130
  store i32 0, i32* %arrayidx, align 4, !dbg !131
  br label %if.end, !dbg !132

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !133, metadata !DIExpression()), !dbg !135
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !136
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !137
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !138
  store i32 0, i32* %arrayidx2, align 4, !dbg !139
  %2 = load i32*, i32** %data, align 8, !dbg !140
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !141
  %call4 = call i32* @wcsncpy(i32* %2, i32* %arraydecay3, i64 99) #4, !dbg !142
  %3 = load i32*, i32** %data, align 8, !dbg !143
  %arrayidx5 = getelementptr inbounds i32, i32* %3, i64 99, !dbg !143
  store i32 0, i32* %arrayidx5, align 4, !dbg !144
  %4 = load i32*, i32** %data, align 8, !dbg !145
  call void @printWLine(i32* %4), !dbg !146
  ret void, !dbg !147
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
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 26, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_05.c", directory: "/root/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_05_bad", scope: !10, file: !10, line: 30, type: !19, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !24, line: 74, baseType: !11)
!24 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!25 = !DILocation(line: 32, column: 15, scope: !18)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !10, line: 33, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 1600, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 50)
!30 = !DILocation(line: 33, column: 13, scope: !18)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !10, line: 34, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 3200, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 34, column: 13, scope: !18)
!36 = !DILocation(line: 35, column: 8, scope: !37)
!37 = distinct !DILexicalBlock(scope: !18, file: !10, line: 35, column: 8)
!38 = !DILocation(line: 35, column: 8, scope: !18)
!39 = !DILocation(line: 39, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !10, line: 36, column: 5)
!41 = !DILocation(line: 39, column: 14, scope: !40)
!42 = !DILocation(line: 40, column: 9, scope: !40)
!43 = !DILocation(line: 40, column: 17, scope: !40)
!44 = !DILocation(line: 41, column: 5, scope: !40)
!45 = !DILocalVariable(name: "source", scope: !46, file: !10, line: 43, type: !32)
!46 = distinct !DILexicalBlock(scope: !18, file: !10, line: 42, column: 5)
!47 = !DILocation(line: 43, column: 17, scope: !46)
!48 = !DILocation(line: 44, column: 17, scope: !46)
!49 = !DILocation(line: 44, column: 9, scope: !46)
!50 = !DILocation(line: 45, column: 9, scope: !46)
!51 = !DILocation(line: 45, column: 23, scope: !46)
!52 = !DILocation(line: 47, column: 17, scope: !46)
!53 = !DILocation(line: 47, column: 23, scope: !46)
!54 = !DILocation(line: 47, column: 9, scope: !46)
!55 = !DILocation(line: 48, column: 9, scope: !46)
!56 = !DILocation(line: 48, column: 21, scope: !46)
!57 = !DILocation(line: 49, column: 20, scope: !46)
!58 = !DILocation(line: 49, column: 9, scope: !46)
!59 = !DILocation(line: 51, column: 1, scope: !18)
!60 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_05_good", scope: !10, file: !10, line: 108, type: !19, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DILocation(line: 110, column: 5, scope: !60)
!62 = !DILocation(line: 111, column: 5, scope: !60)
!63 = !DILocation(line: 112, column: 1, scope: !60)
!64 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 124, type: !65, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!65 = !DISubroutineType(types: !66)
!66 = !{!11, !11, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !10, line: 124, type: !11)
!71 = !DILocation(line: 124, column: 14, scope: !64)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !10, line: 124, type: !67)
!73 = !DILocation(line: 124, column: 27, scope: !64)
!74 = !DILocation(line: 127, column: 22, scope: !64)
!75 = !DILocation(line: 127, column: 12, scope: !64)
!76 = !DILocation(line: 127, column: 5, scope: !64)
!77 = !DILocation(line: 129, column: 5, scope: !64)
!78 = !DILocation(line: 130, column: 5, scope: !64)
!79 = !DILocation(line: 131, column: 5, scope: !64)
!80 = !DILocation(line: 134, column: 5, scope: !64)
!81 = !DILocation(line: 135, column: 5, scope: !64)
!82 = !DILocation(line: 136, column: 5, scope: !64)
!83 = !DILocation(line: 138, column: 5, scope: !64)
!84 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 58, type: !19, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!85 = !DILocalVariable(name: "data", scope: !84, file: !10, line: 60, type: !22)
!86 = !DILocation(line: 60, column: 15, scope: !84)
!87 = !DILocalVariable(name: "dataBadBuffer", scope: !84, file: !10, line: 61, type: !27)
!88 = !DILocation(line: 61, column: 13, scope: !84)
!89 = !DILocalVariable(name: "dataGoodBuffer", scope: !84, file: !10, line: 62, type: !32)
!90 = !DILocation(line: 62, column: 13, scope: !84)
!91 = !DILocation(line: 63, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !84, file: !10, line: 63, column: 8)
!93 = !DILocation(line: 63, column: 8, scope: !84)
!94 = !DILocation(line: 66, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !10, line: 64, column: 5)
!96 = !DILocation(line: 67, column: 5, scope: !95)
!97 = !DILocation(line: 71, column: 16, scope: !98)
!98 = distinct !DILexicalBlock(scope: !92, file: !10, line: 69, column: 5)
!99 = !DILocation(line: 71, column: 14, scope: !98)
!100 = !DILocation(line: 72, column: 9, scope: !98)
!101 = !DILocation(line: 72, column: 17, scope: !98)
!102 = !DILocalVariable(name: "source", scope: !103, file: !10, line: 75, type: !32)
!103 = distinct !DILexicalBlock(scope: !84, file: !10, line: 74, column: 5)
!104 = !DILocation(line: 75, column: 17, scope: !103)
!105 = !DILocation(line: 76, column: 17, scope: !103)
!106 = !DILocation(line: 76, column: 9, scope: !103)
!107 = !DILocation(line: 77, column: 9, scope: !103)
!108 = !DILocation(line: 77, column: 23, scope: !103)
!109 = !DILocation(line: 79, column: 17, scope: !103)
!110 = !DILocation(line: 79, column: 23, scope: !103)
!111 = !DILocation(line: 79, column: 9, scope: !103)
!112 = !DILocation(line: 80, column: 9, scope: !103)
!113 = !DILocation(line: 80, column: 21, scope: !103)
!114 = !DILocation(line: 81, column: 20, scope: !103)
!115 = !DILocation(line: 81, column: 9, scope: !103)
!116 = !DILocation(line: 83, column: 1, scope: !84)
!117 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 86, type: !19, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!118 = !DILocalVariable(name: "data", scope: !117, file: !10, line: 88, type: !22)
!119 = !DILocation(line: 88, column: 15, scope: !117)
!120 = !DILocalVariable(name: "dataBadBuffer", scope: !117, file: !10, line: 89, type: !27)
!121 = !DILocation(line: 89, column: 13, scope: !117)
!122 = !DILocalVariable(name: "dataGoodBuffer", scope: !117, file: !10, line: 90, type: !32)
!123 = !DILocation(line: 90, column: 13, scope: !117)
!124 = !DILocation(line: 91, column: 8, scope: !125)
!125 = distinct !DILexicalBlock(scope: !117, file: !10, line: 91, column: 8)
!126 = !DILocation(line: 91, column: 8, scope: !117)
!127 = !DILocation(line: 94, column: 16, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !10, line: 92, column: 5)
!129 = !DILocation(line: 94, column: 14, scope: !128)
!130 = !DILocation(line: 95, column: 9, scope: !128)
!131 = !DILocation(line: 95, column: 17, scope: !128)
!132 = !DILocation(line: 96, column: 5, scope: !128)
!133 = !DILocalVariable(name: "source", scope: !134, file: !10, line: 98, type: !32)
!134 = distinct !DILexicalBlock(scope: !117, file: !10, line: 97, column: 5)
!135 = !DILocation(line: 98, column: 17, scope: !134)
!136 = !DILocation(line: 99, column: 17, scope: !134)
!137 = !DILocation(line: 99, column: 9, scope: !134)
!138 = !DILocation(line: 100, column: 9, scope: !134)
!139 = !DILocation(line: 100, column: 23, scope: !134)
!140 = !DILocation(line: 102, column: 17, scope: !134)
!141 = !DILocation(line: 102, column: 23, scope: !134)
!142 = !DILocation(line: 102, column: 9, scope: !134)
!143 = !DILocation(line: 103, column: 9, scope: !134)
!144 = !DILocation(line: 103, column: 21, scope: !134)
!145 = !DILocation(line: 104, column: 20, scope: !134)
!146 = !DILocation(line: 104, column: 9, scope: !134)
!147 = !DILocation(line: 106, column: 1, scope: !117)
