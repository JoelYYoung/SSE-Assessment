; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_05.c"
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  %0 = load i32, i32* @staticTrue, align 4, !dbg !35
  %tobool = icmp ne i32 %0, 0, !dbg !35
  br i1 %tobool, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store i8* %arraydecay, i8** %data, align 8, !dbg !40
  %1 = load i8*, i8** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !41
  store i8 0, i8* %arrayidx, align 1, !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !44, metadata !DIExpression()), !dbg !46
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !47
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !48
  store i8 0, i8* %arrayidx2, align 1, !dbg !49
  %2 = load i8*, i8** %data, align 8, !dbg !50
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !51
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 16 %arraydecay3, i64 100, i1 false), !dbg !51
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

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_05_good() #0 !dbg !57 {
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
  %call = call i64 @time(i64* null) #6, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #6, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_05_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_05_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

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
  %0 = load i32, i32* @staticFalse, align 4, !dbg !86
  %tobool = icmp ne i32 %0, 0, !dbg !86
  br i1 %tobool, label %if.then, label %if.else, !dbg !88

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !89
  br label %if.end, !dbg !91

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !92
  store i8* %arraydecay, i8** %data, align 8, !dbg !94
  %1 = load i8*, i8** %data, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !95
  store i8 0, i8* %arrayidx, align 1, !dbg !96
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !97, metadata !DIExpression()), !dbg !99
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !100
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !101
  store i8 0, i8* %arrayidx2, align 1, !dbg !102
  %2 = load i8*, i8** %data, align 8, !dbg !103
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !104
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 16 %arraydecay3, i64 100, i1 false), !dbg !104
  %3 = load i8*, i8** %data, align 8, !dbg !105
  %arrayidx4 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !105
  store i8 0, i8* %arrayidx4, align 1, !dbg !106
  %4 = load i8*, i8** %data, align 8, !dbg !107
  call void @printLine(i8* %4), !dbg !108
  ret void, !dbg !109
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !110 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  %0 = load i32, i32* @staticTrue, align 4, !dbg !117
  %tobool = icmp ne i32 %0, 0, !dbg !117
  br i1 %tobool, label %if.then, label %if.end, !dbg !119

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !120
  store i8* %arraydecay, i8** %data, align 8, !dbg !122
  %1 = load i8*, i8** %data, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !123
  store i8 0, i8* %arrayidx, align 1, !dbg !124
  br label %if.end, !dbg !125

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !126, metadata !DIExpression()), !dbg !128
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !129
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !130
  store i8 0, i8* %arrayidx2, align 1, !dbg !131
  %2 = load i8*, i8** %data, align 8, !dbg !132
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !133
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 16 %arraydecay3, i64 100, i1 false), !dbg !133
  %3 = load i8*, i8** %data, align 8, !dbg !134
  %arrayidx4 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !134
  store i8 0, i8* %arrayidx4, align 1, !dbg !135
  %4 = load i8*, i8** %data, align 8, !dbg !136
  call void @printLine(i8* %4), !dbg !137
  ret void, !dbg !138
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 26, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_05.c", directory: "/root/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_05_bad", scope: !10, file: !10, line: 30, type: !19, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!24 = !DILocation(line: 32, column: 12, scope: !18)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !10, line: 33, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 400, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 33, column: 10, scope: !18)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !10, line: 34, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 800, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 34, column: 10, scope: !18)
!35 = !DILocation(line: 35, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !18, file: !10, line: 35, column: 8)
!37 = !DILocation(line: 35, column: 8, scope: !18)
!38 = !DILocation(line: 39, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !10, line: 36, column: 5)
!40 = !DILocation(line: 39, column: 14, scope: !39)
!41 = !DILocation(line: 40, column: 9, scope: !39)
!42 = !DILocation(line: 40, column: 17, scope: !39)
!43 = !DILocation(line: 41, column: 5, scope: !39)
!44 = !DILocalVariable(name: "source", scope: !45, file: !10, line: 43, type: !31)
!45 = distinct !DILexicalBlock(scope: !18, file: !10, line: 42, column: 5)
!46 = !DILocation(line: 43, column: 14, scope: !45)
!47 = !DILocation(line: 44, column: 9, scope: !45)
!48 = !DILocation(line: 45, column: 9, scope: !45)
!49 = !DILocation(line: 45, column: 23, scope: !45)
!50 = !DILocation(line: 47, column: 16, scope: !45)
!51 = !DILocation(line: 47, column: 9, scope: !45)
!52 = !DILocation(line: 48, column: 9, scope: !45)
!53 = !DILocation(line: 48, column: 21, scope: !45)
!54 = !DILocation(line: 49, column: 19, scope: !45)
!55 = !DILocation(line: 49, column: 9, scope: !45)
!56 = !DILocation(line: 51, column: 1, scope: !18)
!57 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_05_good", scope: !10, file: !10, line: 108, type: !19, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!58 = !DILocation(line: 110, column: 5, scope: !57)
!59 = !DILocation(line: 111, column: 5, scope: !57)
!60 = !DILocation(line: 112, column: 1, scope: !57)
!61 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 124, type: !62, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!62 = !DISubroutineType(types: !63)
!63 = !{!11, !11, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !10, line: 124, type: !11)
!66 = !DILocation(line: 124, column: 14, scope: !61)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !10, line: 124, type: !64)
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
!79 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 58, type: !19, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DILocalVariable(name: "data", scope: !79, file: !10, line: 60, type: !22)
!81 = !DILocation(line: 60, column: 12, scope: !79)
!82 = !DILocalVariable(name: "dataBadBuffer", scope: !79, file: !10, line: 61, type: !26)
!83 = !DILocation(line: 61, column: 10, scope: !79)
!84 = !DILocalVariable(name: "dataGoodBuffer", scope: !79, file: !10, line: 62, type: !31)
!85 = !DILocation(line: 62, column: 10, scope: !79)
!86 = !DILocation(line: 63, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !79, file: !10, line: 63, column: 8)
!88 = !DILocation(line: 63, column: 8, scope: !79)
!89 = !DILocation(line: 66, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !10, line: 64, column: 5)
!91 = !DILocation(line: 67, column: 5, scope: !90)
!92 = !DILocation(line: 71, column: 16, scope: !93)
!93 = distinct !DILexicalBlock(scope: !87, file: !10, line: 69, column: 5)
!94 = !DILocation(line: 71, column: 14, scope: !93)
!95 = !DILocation(line: 72, column: 9, scope: !93)
!96 = !DILocation(line: 72, column: 17, scope: !93)
!97 = !DILocalVariable(name: "source", scope: !98, file: !10, line: 75, type: !31)
!98 = distinct !DILexicalBlock(scope: !79, file: !10, line: 74, column: 5)
!99 = !DILocation(line: 75, column: 14, scope: !98)
!100 = !DILocation(line: 76, column: 9, scope: !98)
!101 = !DILocation(line: 77, column: 9, scope: !98)
!102 = !DILocation(line: 77, column: 23, scope: !98)
!103 = !DILocation(line: 79, column: 16, scope: !98)
!104 = !DILocation(line: 79, column: 9, scope: !98)
!105 = !DILocation(line: 80, column: 9, scope: !98)
!106 = !DILocation(line: 80, column: 21, scope: !98)
!107 = !DILocation(line: 81, column: 19, scope: !98)
!108 = !DILocation(line: 81, column: 9, scope: !98)
!109 = !DILocation(line: 83, column: 1, scope: !79)
!110 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 86, type: !19, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!111 = !DILocalVariable(name: "data", scope: !110, file: !10, line: 88, type: !22)
!112 = !DILocation(line: 88, column: 12, scope: !110)
!113 = !DILocalVariable(name: "dataBadBuffer", scope: !110, file: !10, line: 89, type: !26)
!114 = !DILocation(line: 89, column: 10, scope: !110)
!115 = !DILocalVariable(name: "dataGoodBuffer", scope: !110, file: !10, line: 90, type: !31)
!116 = !DILocation(line: 90, column: 10, scope: !110)
!117 = !DILocation(line: 91, column: 8, scope: !118)
!118 = distinct !DILexicalBlock(scope: !110, file: !10, line: 91, column: 8)
!119 = !DILocation(line: 91, column: 8, scope: !110)
!120 = !DILocation(line: 94, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !10, line: 92, column: 5)
!122 = !DILocation(line: 94, column: 14, scope: !121)
!123 = !DILocation(line: 95, column: 9, scope: !121)
!124 = !DILocation(line: 95, column: 17, scope: !121)
!125 = !DILocation(line: 96, column: 5, scope: !121)
!126 = !DILocalVariable(name: "source", scope: !127, file: !10, line: 98, type: !31)
!127 = distinct !DILexicalBlock(scope: !110, file: !10, line: 97, column: 5)
!128 = !DILocation(line: 98, column: 14, scope: !127)
!129 = !DILocation(line: 99, column: 9, scope: !127)
!130 = !DILocation(line: 100, column: 9, scope: !127)
!131 = !DILocation(line: 100, column: 23, scope: !127)
!132 = !DILocation(line: 102, column: 16, scope: !127)
!133 = !DILocation(line: 102, column: 9, scope: !127)
!134 = !DILocation(line: 103, column: 9, scope: !127)
!135 = !DILocation(line: 103, column: 21, scope: !127)
!136 = !DILocation(line: 104, column: 19, scope: !127)
!137 = !DILocation(line: 104, column: 9, scope: !127)
!138 = !DILocation(line: 106, column: 1, scope: !110)
