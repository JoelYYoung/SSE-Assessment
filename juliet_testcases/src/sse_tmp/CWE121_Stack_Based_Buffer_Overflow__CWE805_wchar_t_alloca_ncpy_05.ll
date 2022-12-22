; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_05.c"
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_05_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 200, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = alloca i8, i64 400, align 16, !dbg !32
  %3 = bitcast i8* %2 to i32*, !dbg !33
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !31
  %4 = load i32, i32* @staticTrue, align 4, !dbg !34
  %tobool = icmp ne i32 %4, 0, !dbg !34
  br i1 %tobool, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !37
  store i32* %5, i32** %data, align 8, !dbg !39
  %6 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  br label %if.end, !dbg !42

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !43, metadata !DIExpression()), !dbg !48
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !49
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !50
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !51
  store i32 0, i32* %arrayidx1, align 4, !dbg !52
  %7 = load i32*, i32** %data, align 8, !dbg !53
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !54
  %call3 = call i32* @wcsncpy(i32* %7, i32* %arraydecay2, i64 99) #4, !dbg !55
  %8 = load i32*, i32** %data, align 8, !dbg !56
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !56
  store i32 0, i32* %arrayidx4, align 4, !dbg !57
  %9 = load i32*, i32** %data, align 8, !dbg !58
  call void @printWLine(i32* %9), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_05_good() #0 !dbg !61 {
entry:
  call void @goodG2B1(), !dbg !62
  call void @goodG2B2(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !65 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !73, metadata !DIExpression()), !dbg !74
  %call = call i64 @time(i64* null) #4, !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 %conv) #4, !dbg !77
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_05_good(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_05_bad(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !85 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %0 = alloca i8, i64 200, align 16, !dbg !90
  %1 = bitcast i8* %0 to i32*, !dbg !91
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  %2 = alloca i8, i64 400, align 16, !dbg !94
  %3 = bitcast i8* %2 to i32*, !dbg !95
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !93
  %4 = load i32, i32* @staticFalse, align 4, !dbg !96
  %tobool = icmp ne i32 %4, 0, !dbg !96
  br i1 %tobool, label %if.then, label %if.else, !dbg !98

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !99
  br label %if.end, !dbg !101

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !102
  store i32* %5, i32** %data, align 8, !dbg !104
  %6 = load i32*, i32** %data, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !105
  store i32 0, i32* %arrayidx, align 4, !dbg !106
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !107, metadata !DIExpression()), !dbg !109
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !110
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !111
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !112
  store i32 0, i32* %arrayidx1, align 4, !dbg !113
  %7 = load i32*, i32** %data, align 8, !dbg !114
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !115
  %call3 = call i32* @wcsncpy(i32* %7, i32* %arraydecay2, i64 99) #4, !dbg !116
  %8 = load i32*, i32** %data, align 8, !dbg !117
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !117
  store i32 0, i32* %arrayidx4, align 4, !dbg !118
  %9 = load i32*, i32** %data, align 8, !dbg !119
  call void @printWLine(i32* %9), !dbg !120
  ret void, !dbg !121
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !122 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !125, metadata !DIExpression()), !dbg !126
  %0 = alloca i8, i64 200, align 16, !dbg !127
  %1 = bitcast i8* %0 to i32*, !dbg !128
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !129, metadata !DIExpression()), !dbg !130
  %2 = alloca i8, i64 400, align 16, !dbg !131
  %3 = bitcast i8* %2 to i32*, !dbg !132
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !130
  %4 = load i32, i32* @staticTrue, align 4, !dbg !133
  %tobool = icmp ne i32 %4, 0, !dbg !133
  br i1 %tobool, label %if.then, label %if.end, !dbg !135

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !136
  store i32* %5, i32** %data, align 8, !dbg !138
  %6 = load i32*, i32** %data, align 8, !dbg !139
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !139
  store i32 0, i32* %arrayidx, align 4, !dbg !140
  br label %if.end, !dbg !141

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !142, metadata !DIExpression()), !dbg !144
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !145
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !146
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !147
  store i32 0, i32* %arrayidx1, align 4, !dbg !148
  %7 = load i32*, i32** %data, align 8, !dbg !149
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !150
  %call3 = call i32* @wcsncpy(i32* %7, i32* %arraydecay2, i64 99) #4, !dbg !151
  %8 = load i32*, i32** %data, align 8, !dbg !152
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !152
  store i32 0, i32* %arrayidx4, align 4, !dbg !153
  %9 = load i32*, i32** %data, align 8, !dbg !154
  call void @printWLine(i32* %9), !dbg !155
  ret void, !dbg !156
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
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !14, line: 26, type: !9, isLocal: true, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_05.c", directory: "/root/SSE-Assessment")
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_05_bad", scope: !14, file: !14, line: 30, type: !22, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !14, line: 32, type: !6)
!25 = !DILocation(line: 32, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !21, file: !14, line: 33, type: !6)
!27 = !DILocation(line: 33, column: 15, scope: !21)
!28 = !DILocation(line: 33, column: 42, scope: !21)
!29 = !DILocation(line: 33, column: 31, scope: !21)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !21, file: !14, line: 34, type: !6)
!31 = !DILocation(line: 34, column: 15, scope: !21)
!32 = !DILocation(line: 34, column: 43, scope: !21)
!33 = !DILocation(line: 34, column: 32, scope: !21)
!34 = !DILocation(line: 35, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !21, file: !14, line: 35, column: 8)
!36 = !DILocation(line: 35, column: 8, scope: !21)
!37 = !DILocation(line: 39, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !14, line: 36, column: 5)
!39 = !DILocation(line: 39, column: 14, scope: !38)
!40 = !DILocation(line: 40, column: 9, scope: !38)
!41 = !DILocation(line: 40, column: 17, scope: !38)
!42 = !DILocation(line: 41, column: 5, scope: !38)
!43 = !DILocalVariable(name: "source", scope: !44, file: !14, line: 43, type: !45)
!44 = distinct !DILexicalBlock(scope: !21, file: !14, line: 42, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 100)
!48 = !DILocation(line: 43, column: 17, scope: !44)
!49 = !DILocation(line: 44, column: 17, scope: !44)
!50 = !DILocation(line: 44, column: 9, scope: !44)
!51 = !DILocation(line: 45, column: 9, scope: !44)
!52 = !DILocation(line: 45, column: 23, scope: !44)
!53 = !DILocation(line: 47, column: 17, scope: !44)
!54 = !DILocation(line: 47, column: 23, scope: !44)
!55 = !DILocation(line: 47, column: 9, scope: !44)
!56 = !DILocation(line: 48, column: 9, scope: !44)
!57 = !DILocation(line: 48, column: 21, scope: !44)
!58 = !DILocation(line: 49, column: 20, scope: !44)
!59 = !DILocation(line: 49, column: 9, scope: !44)
!60 = !DILocation(line: 51, column: 1, scope: !21)
!61 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_05_good", scope: !14, file: !14, line: 108, type: !22, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!62 = !DILocation(line: 110, column: 5, scope: !61)
!63 = !DILocation(line: 111, column: 5, scope: !61)
!64 = !DILocation(line: 112, column: 1, scope: !61)
!65 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 124, type: !66, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!66 = !DISubroutineType(types: !67)
!67 = !{!9, !9, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !14, line: 124, type: !9)
!72 = !DILocation(line: 124, column: 14, scope: !65)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !14, line: 124, type: !68)
!74 = !DILocation(line: 124, column: 27, scope: !65)
!75 = !DILocation(line: 127, column: 22, scope: !65)
!76 = !DILocation(line: 127, column: 12, scope: !65)
!77 = !DILocation(line: 127, column: 5, scope: !65)
!78 = !DILocation(line: 129, column: 5, scope: !65)
!79 = !DILocation(line: 130, column: 5, scope: !65)
!80 = !DILocation(line: 131, column: 5, scope: !65)
!81 = !DILocation(line: 134, column: 5, scope: !65)
!82 = !DILocation(line: 135, column: 5, scope: !65)
!83 = !DILocation(line: 136, column: 5, scope: !65)
!84 = !DILocation(line: 138, column: 5, scope: !65)
!85 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 58, type: !22, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!86 = !DILocalVariable(name: "data", scope: !85, file: !14, line: 60, type: !6)
!87 = !DILocation(line: 60, column: 15, scope: !85)
!88 = !DILocalVariable(name: "dataBadBuffer", scope: !85, file: !14, line: 61, type: !6)
!89 = !DILocation(line: 61, column: 15, scope: !85)
!90 = !DILocation(line: 61, column: 42, scope: !85)
!91 = !DILocation(line: 61, column: 31, scope: !85)
!92 = !DILocalVariable(name: "dataGoodBuffer", scope: !85, file: !14, line: 62, type: !6)
!93 = !DILocation(line: 62, column: 15, scope: !85)
!94 = !DILocation(line: 62, column: 43, scope: !85)
!95 = !DILocation(line: 62, column: 32, scope: !85)
!96 = !DILocation(line: 63, column: 8, scope: !97)
!97 = distinct !DILexicalBlock(scope: !85, file: !14, line: 63, column: 8)
!98 = !DILocation(line: 63, column: 8, scope: !85)
!99 = !DILocation(line: 66, column: 9, scope: !100)
!100 = distinct !DILexicalBlock(scope: !97, file: !14, line: 64, column: 5)
!101 = !DILocation(line: 67, column: 5, scope: !100)
!102 = !DILocation(line: 71, column: 16, scope: !103)
!103 = distinct !DILexicalBlock(scope: !97, file: !14, line: 69, column: 5)
!104 = !DILocation(line: 71, column: 14, scope: !103)
!105 = !DILocation(line: 72, column: 9, scope: !103)
!106 = !DILocation(line: 72, column: 17, scope: !103)
!107 = !DILocalVariable(name: "source", scope: !108, file: !14, line: 75, type: !45)
!108 = distinct !DILexicalBlock(scope: !85, file: !14, line: 74, column: 5)
!109 = !DILocation(line: 75, column: 17, scope: !108)
!110 = !DILocation(line: 76, column: 17, scope: !108)
!111 = !DILocation(line: 76, column: 9, scope: !108)
!112 = !DILocation(line: 77, column: 9, scope: !108)
!113 = !DILocation(line: 77, column: 23, scope: !108)
!114 = !DILocation(line: 79, column: 17, scope: !108)
!115 = !DILocation(line: 79, column: 23, scope: !108)
!116 = !DILocation(line: 79, column: 9, scope: !108)
!117 = !DILocation(line: 80, column: 9, scope: !108)
!118 = !DILocation(line: 80, column: 21, scope: !108)
!119 = !DILocation(line: 81, column: 20, scope: !108)
!120 = !DILocation(line: 81, column: 9, scope: !108)
!121 = !DILocation(line: 83, column: 1, scope: !85)
!122 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 86, type: !22, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!123 = !DILocalVariable(name: "data", scope: !122, file: !14, line: 88, type: !6)
!124 = !DILocation(line: 88, column: 15, scope: !122)
!125 = !DILocalVariable(name: "dataBadBuffer", scope: !122, file: !14, line: 89, type: !6)
!126 = !DILocation(line: 89, column: 15, scope: !122)
!127 = !DILocation(line: 89, column: 42, scope: !122)
!128 = !DILocation(line: 89, column: 31, scope: !122)
!129 = !DILocalVariable(name: "dataGoodBuffer", scope: !122, file: !14, line: 90, type: !6)
!130 = !DILocation(line: 90, column: 15, scope: !122)
!131 = !DILocation(line: 90, column: 43, scope: !122)
!132 = !DILocation(line: 90, column: 32, scope: !122)
!133 = !DILocation(line: 91, column: 8, scope: !134)
!134 = distinct !DILexicalBlock(scope: !122, file: !14, line: 91, column: 8)
!135 = !DILocation(line: 91, column: 8, scope: !122)
!136 = !DILocation(line: 94, column: 16, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !14, line: 92, column: 5)
!138 = !DILocation(line: 94, column: 14, scope: !137)
!139 = !DILocation(line: 95, column: 9, scope: !137)
!140 = !DILocation(line: 95, column: 17, scope: !137)
!141 = !DILocation(line: 96, column: 5, scope: !137)
!142 = !DILocalVariable(name: "source", scope: !143, file: !14, line: 98, type: !45)
!143 = distinct !DILexicalBlock(scope: !122, file: !14, line: 97, column: 5)
!144 = !DILocation(line: 98, column: 17, scope: !143)
!145 = !DILocation(line: 99, column: 17, scope: !143)
!146 = !DILocation(line: 99, column: 9, scope: !143)
!147 = !DILocation(line: 100, column: 9, scope: !143)
!148 = !DILocation(line: 100, column: 23, scope: !143)
!149 = !DILocation(line: 102, column: 17, scope: !143)
!150 = !DILocation(line: 102, column: 23, scope: !143)
!151 = !DILocation(line: 102, column: 9, scope: !143)
!152 = !DILocation(line: 103, column: 9, scope: !143)
!153 = !DILocation(line: 103, column: 21, scope: !143)
!154 = !DILocation(line: 104, column: 20, scope: !143)
!155 = !DILocation(line: 104, column: 9, scope: !143)
!156 = !DILocation(line: 106, column: 1, scope: !122)
