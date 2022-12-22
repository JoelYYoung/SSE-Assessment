; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  %0 = load i32, i32* @staticFive, align 4, !dbg !33
  %cmp = icmp eq i32 %0, 5, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !37
  store i8* %arraydecay, i8** %data, align 8, !dbg !39
  %1 = load i8*, i8** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !40
  store i8 0, i8* %arrayidx, align 1, !dbg !41
  br label %if.end, !dbg !42

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !43, metadata !DIExpression()), !dbg !45
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !46
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !47
  store i8 0, i8* %arrayidx2, align 1, !dbg !48
  %2 = load i8*, i8** %data, align 8, !dbg !49
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !50
  %call = call i8* @strncpy(i8* %2, i8* %arraydecay3, i64 99) #5, !dbg !51
  %3 = load i8*, i8** %data, align 8, !dbg !52
  %arrayidx4 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !52
  store i8 0, i8* %arrayidx4, align 1, !dbg !53
  %4 = load i8*, i8** %data, align 8, !dbg !54
  call void @printLine(i8* %4), !dbg !55
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_07_good() #0 !dbg !57 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_07_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_07_bad(), !dbg !76
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
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  %0 = load i32, i32* @staticFive, align 4, !dbg !86
  %cmp = icmp ne i32 %0, 5, !dbg !88
  br i1 %cmp, label %if.then, label %if.else, !dbg !89

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !90
  br label %if.end, !dbg !92

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !93
  store i8* %arraydecay, i8** %data, align 8, !dbg !95
  %1 = load i8*, i8** %data, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !96
  store i8 0, i8* %arrayidx, align 1, !dbg !97
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !98, metadata !DIExpression()), !dbg !100
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !101
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !102
  store i8 0, i8* %arrayidx2, align 1, !dbg !103
  %2 = load i8*, i8** %data, align 8, !dbg !104
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !105
  %call = call i8* @strncpy(i8* %2, i8* %arraydecay3, i64 99) #5, !dbg !106
  %3 = load i8*, i8** %data, align 8, !dbg !107
  %arrayidx4 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !107
  store i8 0, i8* %arrayidx4, align 1, !dbg !108
  %4 = load i8*, i8** %data, align 8, !dbg !109
  call void @printLine(i8* %4), !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !112 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  %0 = load i32, i32* @staticFive, align 4, !dbg !119
  %cmp = icmp eq i32 %0, 5, !dbg !121
  br i1 %cmp, label %if.then, label %if.end, !dbg !122

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !123
  store i8* %arraydecay, i8** %data, align 8, !dbg !125
  %1 = load i8*, i8** %data, align 8, !dbg !126
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !126
  store i8 0, i8* %arrayidx, align 1, !dbg !127
  br label %if.end, !dbg !128

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !129, metadata !DIExpression()), !dbg !131
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !132
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !132
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !133
  store i8 0, i8* %arrayidx2, align 1, !dbg !134
  %2 = load i8*, i8** %data, align 8, !dbg !135
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !136
  %call = call i8* @strncpy(i8* %2, i8* %arraydecay3, i64 99) #5, !dbg !137
  %3 = load i8*, i8** %data, align 8, !dbg !138
  %arrayidx4 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !138
  store i8 0, i8* %arrayidx4, align 1, !dbg !139
  %4 = load i8*, i8** %data, align 8, !dbg !140
  call void @printLine(i8* %4), !dbg !141
  ret void, !dbg !142
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_07.c", directory: "/root/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_07_bad", scope: !8, file: !8, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 31, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !DILocation(line: 31, column: 12, scope: !16)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !16, file: !8, line: 32, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 400, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 50)
!27 = !DILocation(line: 32, column: 10, scope: !16)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !16, file: !8, line: 33, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 800, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 33, column: 10, scope: !16)
!33 = !DILocation(line: 34, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !16, file: !8, line: 34, column: 8)
!35 = !DILocation(line: 34, column: 18, scope: !34)
!36 = !DILocation(line: 34, column: 8, scope: !16)
!37 = !DILocation(line: 38, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !8, line: 35, column: 5)
!39 = !DILocation(line: 38, column: 14, scope: !38)
!40 = !DILocation(line: 39, column: 9, scope: !38)
!41 = !DILocation(line: 39, column: 17, scope: !38)
!42 = !DILocation(line: 40, column: 5, scope: !38)
!43 = !DILocalVariable(name: "source", scope: !44, file: !8, line: 42, type: !29)
!44 = distinct !DILexicalBlock(scope: !16, file: !8, line: 41, column: 5)
!45 = !DILocation(line: 42, column: 14, scope: !44)
!46 = !DILocation(line: 43, column: 9, scope: !44)
!47 = !DILocation(line: 44, column: 9, scope: !44)
!48 = !DILocation(line: 44, column: 23, scope: !44)
!49 = !DILocation(line: 46, column: 17, scope: !44)
!50 = !DILocation(line: 46, column: 23, scope: !44)
!51 = !DILocation(line: 46, column: 9, scope: !44)
!52 = !DILocation(line: 47, column: 9, scope: !44)
!53 = !DILocation(line: 47, column: 21, scope: !44)
!54 = !DILocation(line: 48, column: 19, scope: !44)
!55 = !DILocation(line: 48, column: 9, scope: !44)
!56 = !DILocation(line: 50, column: 1, scope: !16)
!57 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_07_good", scope: !8, file: !8, line: 107, type: !17, scopeLine: 108, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!58 = !DILocation(line: 109, column: 5, scope: !57)
!59 = !DILocation(line: 110, column: 5, scope: !57)
!60 = !DILocation(line: 111, column: 1, scope: !57)
!61 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 123, type: !62, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!62 = !DISubroutineType(types: !63)
!63 = !{!9, !9, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !8, line: 123, type: !9)
!66 = !DILocation(line: 123, column: 14, scope: !61)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !8, line: 123, type: !64)
!68 = !DILocation(line: 123, column: 27, scope: !61)
!69 = !DILocation(line: 126, column: 22, scope: !61)
!70 = !DILocation(line: 126, column: 12, scope: !61)
!71 = !DILocation(line: 126, column: 5, scope: !61)
!72 = !DILocation(line: 128, column: 5, scope: !61)
!73 = !DILocation(line: 129, column: 5, scope: !61)
!74 = !DILocation(line: 130, column: 5, scope: !61)
!75 = !DILocation(line: 133, column: 5, scope: !61)
!76 = !DILocation(line: 134, column: 5, scope: !61)
!77 = !DILocation(line: 135, column: 5, scope: !61)
!78 = !DILocation(line: 137, column: 5, scope: !61)
!79 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 57, type: !17, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DILocalVariable(name: "data", scope: !79, file: !8, line: 59, type: !20)
!81 = !DILocation(line: 59, column: 12, scope: !79)
!82 = !DILocalVariable(name: "dataBadBuffer", scope: !79, file: !8, line: 60, type: !24)
!83 = !DILocation(line: 60, column: 10, scope: !79)
!84 = !DILocalVariable(name: "dataGoodBuffer", scope: !79, file: !8, line: 61, type: !29)
!85 = !DILocation(line: 61, column: 10, scope: !79)
!86 = !DILocation(line: 62, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !79, file: !8, line: 62, column: 8)
!88 = !DILocation(line: 62, column: 18, scope: !87)
!89 = !DILocation(line: 62, column: 8, scope: !79)
!90 = !DILocation(line: 65, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !8, line: 63, column: 5)
!92 = !DILocation(line: 66, column: 5, scope: !91)
!93 = !DILocation(line: 70, column: 16, scope: !94)
!94 = distinct !DILexicalBlock(scope: !87, file: !8, line: 68, column: 5)
!95 = !DILocation(line: 70, column: 14, scope: !94)
!96 = !DILocation(line: 71, column: 9, scope: !94)
!97 = !DILocation(line: 71, column: 17, scope: !94)
!98 = !DILocalVariable(name: "source", scope: !99, file: !8, line: 74, type: !29)
!99 = distinct !DILexicalBlock(scope: !79, file: !8, line: 73, column: 5)
!100 = !DILocation(line: 74, column: 14, scope: !99)
!101 = !DILocation(line: 75, column: 9, scope: !99)
!102 = !DILocation(line: 76, column: 9, scope: !99)
!103 = !DILocation(line: 76, column: 23, scope: !99)
!104 = !DILocation(line: 78, column: 17, scope: !99)
!105 = !DILocation(line: 78, column: 23, scope: !99)
!106 = !DILocation(line: 78, column: 9, scope: !99)
!107 = !DILocation(line: 79, column: 9, scope: !99)
!108 = !DILocation(line: 79, column: 21, scope: !99)
!109 = !DILocation(line: 80, column: 19, scope: !99)
!110 = !DILocation(line: 80, column: 9, scope: !99)
!111 = !DILocation(line: 82, column: 1, scope: !79)
!112 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 85, type: !17, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!113 = !DILocalVariable(name: "data", scope: !112, file: !8, line: 87, type: !20)
!114 = !DILocation(line: 87, column: 12, scope: !112)
!115 = !DILocalVariable(name: "dataBadBuffer", scope: !112, file: !8, line: 88, type: !24)
!116 = !DILocation(line: 88, column: 10, scope: !112)
!117 = !DILocalVariable(name: "dataGoodBuffer", scope: !112, file: !8, line: 89, type: !29)
!118 = !DILocation(line: 89, column: 10, scope: !112)
!119 = !DILocation(line: 90, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !112, file: !8, line: 90, column: 8)
!121 = !DILocation(line: 90, column: 18, scope: !120)
!122 = !DILocation(line: 90, column: 8, scope: !112)
!123 = !DILocation(line: 93, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !8, line: 91, column: 5)
!125 = !DILocation(line: 93, column: 14, scope: !124)
!126 = !DILocation(line: 94, column: 9, scope: !124)
!127 = !DILocation(line: 94, column: 17, scope: !124)
!128 = !DILocation(line: 95, column: 5, scope: !124)
!129 = !DILocalVariable(name: "source", scope: !130, file: !8, line: 97, type: !29)
!130 = distinct !DILexicalBlock(scope: !112, file: !8, line: 96, column: 5)
!131 = !DILocation(line: 97, column: 14, scope: !130)
!132 = !DILocation(line: 98, column: 9, scope: !130)
!133 = !DILocation(line: 99, column: 9, scope: !130)
!134 = !DILocation(line: 99, column: 23, scope: !130)
!135 = !DILocation(line: 101, column: 17, scope: !130)
!136 = !DILocation(line: 101, column: 23, scope: !130)
!137 = !DILocation(line: 101, column: 9, scope: !130)
!138 = !DILocation(line: 102, column: 9, scope: !130)
!139 = !DILocation(line: 102, column: 21, scope: !130)
!140 = !DILocation(line: 103, column: 19, scope: !130)
!141 = !DILocation(line: 103, column: 9, scope: !130)
!142 = !DILocation(line: 105, column: 1, scope: !112)
