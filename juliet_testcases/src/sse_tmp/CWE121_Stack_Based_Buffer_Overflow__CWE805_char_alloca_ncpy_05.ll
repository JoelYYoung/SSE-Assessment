; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !10
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_05_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 50, align 16, !dbg !27
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %1 = alloca i8, i64 100, align 16, !dbg !30
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !29
  %2 = load i32, i32* @staticTrue, align 4, !dbg !31
  %tobool = icmp ne i32 %2, 0, !dbg !31
  br i1 %tobool, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !34
  store i8* %3, i8** %data, align 8, !dbg !36
  %4 = load i8*, i8** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !46
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !47
  store i8 0, i8* %arrayidx1, align 1, !dbg !48
  %5 = load i8*, i8** %data, align 8, !dbg !49
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !50
  %call = call i8* @strncpy(i8* %5, i8* %arraydecay2, i64 99) #5, !dbg !51
  %6 = load i8*, i8** %data, align 8, !dbg !52
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !52
  store i8 0, i8* %arrayidx3, align 1, !dbg !53
  %7 = load i8*, i8** %data, align 8, !dbg !54
  call void @printLine(i8* %7), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_05_good() #0 !dbg !57 {
entry:
  call void @goodG2B1(), !dbg !58
  call void @goodG2B2(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #5, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #5, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_05_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_05_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !79 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %0 = alloca i8, i64 50, align 16, !dbg !84
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %1 = alloca i8, i64 100, align 16, !dbg !87
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !86
  %2 = load i32, i32* @staticFalse, align 4, !dbg !88
  %tobool = icmp ne i32 %2, 0, !dbg !88
  br i1 %tobool, label %if.then, label %if.else, !dbg !90

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !91
  br label %if.end, !dbg !93

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !94
  store i8* %3, i8** %data, align 8, !dbg !96
  %4 = load i8*, i8** %data, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !97
  store i8 0, i8* %arrayidx, align 1, !dbg !98
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !99, metadata !DIExpression()), !dbg !101
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !102
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !103
  store i8 0, i8* %arrayidx1, align 1, !dbg !104
  %5 = load i8*, i8** %data, align 8, !dbg !105
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !106
  %call = call i8* @strncpy(i8* %5, i8* %arraydecay2, i64 99) #5, !dbg !107
  %6 = load i8*, i8** %data, align 8, !dbg !108
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !108
  store i8 0, i8* %arrayidx3, align 1, !dbg !109
  %7 = load i8*, i8** %data, align 8, !dbg !110
  call void @printLine(i8* %7), !dbg !111
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !113 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  %0 = alloca i8, i64 50, align 16, !dbg !118
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !119, metadata !DIExpression()), !dbg !120
  %1 = alloca i8, i64 100, align 16, !dbg !121
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !120
  %2 = load i32, i32* @staticTrue, align 4, !dbg !122
  %tobool = icmp ne i32 %2, 0, !dbg !122
  br i1 %tobool, label %if.then, label %if.end, !dbg !124

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !125
  store i8* %3, i8** %data, align 8, !dbg !127
  %4 = load i8*, i8** %data, align 8, !dbg !128
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !128
  store i8 0, i8* %arrayidx, align 1, !dbg !129
  br label %if.end, !dbg !130

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !131, metadata !DIExpression()), !dbg !133
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !134
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !134
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !135
  store i8 0, i8* %arrayidx1, align 1, !dbg !136
  %5 = load i8*, i8** %data, align 8, !dbg !137
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !138
  %call = call i8* @strncpy(i8* %5, i8* %arraydecay2, i64 99) #5, !dbg !139
  %6 = load i8*, i8** %data, align 8, !dbg !140
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !140
  store i8 0, i8* %arrayidx3, align 1, !dbg !141
  %7 = load i8*, i8** %data, align 8, !dbg !142
  call void @printLine(i8* %7), !dbg !143
  ret void, !dbg !144
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !12, line: 25, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !12, line: 26, type: !13, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_05.c", directory: "/root/SSE-Assessment")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_05_bad", scope: !12, file: !12, line: 30, type: !21, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !12, line: 32, type: !6)
!24 = !DILocation(line: 32, column: 12, scope: !20)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !20, file: !12, line: 33, type: !6)
!26 = !DILocation(line: 33, column: 12, scope: !20)
!27 = !DILocation(line: 33, column: 36, scope: !20)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !20, file: !12, line: 34, type: !6)
!29 = !DILocation(line: 34, column: 12, scope: !20)
!30 = !DILocation(line: 34, column: 37, scope: !20)
!31 = !DILocation(line: 35, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !20, file: !12, line: 35, column: 8)
!33 = !DILocation(line: 35, column: 8, scope: !20)
!34 = !DILocation(line: 39, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !12, line: 36, column: 5)
!36 = !DILocation(line: 39, column: 14, scope: !35)
!37 = !DILocation(line: 40, column: 9, scope: !35)
!38 = !DILocation(line: 40, column: 17, scope: !35)
!39 = !DILocation(line: 41, column: 5, scope: !35)
!40 = !DILocalVariable(name: "source", scope: !41, file: !12, line: 43, type: !42)
!41 = distinct !DILexicalBlock(scope: !20, file: !12, line: 42, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 43, column: 14, scope: !41)
!46 = !DILocation(line: 44, column: 9, scope: !41)
!47 = !DILocation(line: 45, column: 9, scope: !41)
!48 = !DILocation(line: 45, column: 23, scope: !41)
!49 = !DILocation(line: 47, column: 17, scope: !41)
!50 = !DILocation(line: 47, column: 23, scope: !41)
!51 = !DILocation(line: 47, column: 9, scope: !41)
!52 = !DILocation(line: 48, column: 9, scope: !41)
!53 = !DILocation(line: 48, column: 21, scope: !41)
!54 = !DILocation(line: 49, column: 19, scope: !41)
!55 = !DILocation(line: 49, column: 9, scope: !41)
!56 = !DILocation(line: 51, column: 1, scope: !20)
!57 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_05_good", scope: !12, file: !12, line: 108, type: !21, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!58 = !DILocation(line: 110, column: 5, scope: !57)
!59 = !DILocation(line: 111, column: 5, scope: !57)
!60 = !DILocation(line: 112, column: 1, scope: !57)
!61 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 124, type: !62, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!62 = !DISubroutineType(types: !63)
!63 = !{!13, !13, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !12, line: 124, type: !13)
!66 = !DILocation(line: 124, column: 14, scope: !61)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !12, line: 124, type: !64)
!68 = !DILocation(line: 124, column: 27, scope: !61)
!69 = !DILocation(line: 127, column: 22, scope: !61)
!70 = !DILocation(line: 127, column: 12, scope: !61)
!71 = !DILocation(line: 127, column: 5, scope: !61)
!72 = !DILocation(line: 129, column: 5, scope: !61)
!73 = !DILocation(line: 130, column: 5, scope: !61)
!74 = !DILocation(line: 131, column: 5, scope: !61)
!75 = !DILocation(line: 134, column: 5, scope: !61)
!76 = !DILocation(line: 135, column: 5, scope: !61)
!77 = !DILocation(line: 136, column: 5, scope: !61)
!78 = !DILocation(line: 138, column: 5, scope: !61)
!79 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 58, type: !21, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DILocalVariable(name: "data", scope: !79, file: !12, line: 60, type: !6)
!81 = !DILocation(line: 60, column: 12, scope: !79)
!82 = !DILocalVariable(name: "dataBadBuffer", scope: !79, file: !12, line: 61, type: !6)
!83 = !DILocation(line: 61, column: 12, scope: !79)
!84 = !DILocation(line: 61, column: 36, scope: !79)
!85 = !DILocalVariable(name: "dataGoodBuffer", scope: !79, file: !12, line: 62, type: !6)
!86 = !DILocation(line: 62, column: 12, scope: !79)
!87 = !DILocation(line: 62, column: 37, scope: !79)
!88 = !DILocation(line: 63, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !79, file: !12, line: 63, column: 8)
!90 = !DILocation(line: 63, column: 8, scope: !79)
!91 = !DILocation(line: 66, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !12, line: 64, column: 5)
!93 = !DILocation(line: 67, column: 5, scope: !92)
!94 = !DILocation(line: 71, column: 16, scope: !95)
!95 = distinct !DILexicalBlock(scope: !89, file: !12, line: 69, column: 5)
!96 = !DILocation(line: 71, column: 14, scope: !95)
!97 = !DILocation(line: 72, column: 9, scope: !95)
!98 = !DILocation(line: 72, column: 17, scope: !95)
!99 = !DILocalVariable(name: "source", scope: !100, file: !12, line: 75, type: !42)
!100 = distinct !DILexicalBlock(scope: !79, file: !12, line: 74, column: 5)
!101 = !DILocation(line: 75, column: 14, scope: !100)
!102 = !DILocation(line: 76, column: 9, scope: !100)
!103 = !DILocation(line: 77, column: 9, scope: !100)
!104 = !DILocation(line: 77, column: 23, scope: !100)
!105 = !DILocation(line: 79, column: 17, scope: !100)
!106 = !DILocation(line: 79, column: 23, scope: !100)
!107 = !DILocation(line: 79, column: 9, scope: !100)
!108 = !DILocation(line: 80, column: 9, scope: !100)
!109 = !DILocation(line: 80, column: 21, scope: !100)
!110 = !DILocation(line: 81, column: 19, scope: !100)
!111 = !DILocation(line: 81, column: 9, scope: !100)
!112 = !DILocation(line: 83, column: 1, scope: !79)
!113 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 86, type: !21, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!114 = !DILocalVariable(name: "data", scope: !113, file: !12, line: 88, type: !6)
!115 = !DILocation(line: 88, column: 12, scope: !113)
!116 = !DILocalVariable(name: "dataBadBuffer", scope: !113, file: !12, line: 89, type: !6)
!117 = !DILocation(line: 89, column: 12, scope: !113)
!118 = !DILocation(line: 89, column: 36, scope: !113)
!119 = !DILocalVariable(name: "dataGoodBuffer", scope: !113, file: !12, line: 90, type: !6)
!120 = !DILocation(line: 90, column: 12, scope: !113)
!121 = !DILocation(line: 90, column: 37, scope: !113)
!122 = !DILocation(line: 91, column: 8, scope: !123)
!123 = distinct !DILexicalBlock(scope: !113, file: !12, line: 91, column: 8)
!124 = !DILocation(line: 91, column: 8, scope: !113)
!125 = !DILocation(line: 94, column: 16, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !12, line: 92, column: 5)
!127 = !DILocation(line: 94, column: 14, scope: !126)
!128 = !DILocation(line: 95, column: 9, scope: !126)
!129 = !DILocation(line: 95, column: 17, scope: !126)
!130 = !DILocation(line: 96, column: 5, scope: !126)
!131 = !DILocalVariable(name: "source", scope: !132, file: !12, line: 98, type: !42)
!132 = distinct !DILexicalBlock(scope: !113, file: !12, line: 97, column: 5)
!133 = !DILocation(line: 98, column: 14, scope: !132)
!134 = !DILocation(line: 99, column: 9, scope: !132)
!135 = !DILocation(line: 100, column: 9, scope: !132)
!136 = !DILocation(line: 100, column: 23, scope: !132)
!137 = !DILocation(line: 102, column: 17, scope: !132)
!138 = !DILocation(line: 102, column: 23, scope: !132)
!139 = !DILocation(line: 102, column: 9, scope: !132)
!140 = !DILocation(line: 103, column: 9, scope: !132)
!141 = !DILocation(line: 103, column: 21, scope: !132)
!142 = !DILocation(line: 104, column: 19, scope: !132)
!143 = !DILocation(line: 104, column: 9, scope: !132)
!144 = !DILocation(line: 106, column: 1, scope: !113)
