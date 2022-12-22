; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !22, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  %0 = load i32, i32* @staticFive, align 4, !dbg !32
  %cmp = icmp eq i32 %0, 5, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !36
  store i32* %arraydecay, i32** %data, align 8, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !40, metadata !DIExpression()), !dbg !42
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !42
  %2 = load i32*, i32** %data, align 8, !dbg !43
  %3 = bitcast i32* %2 to i8*, !dbg !44
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !44
  %4 = bitcast i32* %arraydecay1 to i8*, !dbg !44
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !44
  %5 = load i32*, i32** %data, align 8, !dbg !45
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !45
  %6 = load i32, i32* %arrayidx, align 4, !dbg !45
  call void @printIntLine(i32 %6), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_07_good() #0 !dbg !48 {
entry:
  call void @goodG2B1(), !dbg !49
  call void @goodG2B2(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* null) #6, !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 %conv) #6, !dbg !64
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_07_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_07_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !72 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %0 = load i32, i32* @staticFive, align 4, !dbg !79
  %cmp = icmp ne i32 %0, 5, !dbg !81
  br i1 %cmp, label %if.then, label %if.else, !dbg !82

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !83
  br label %if.end, !dbg !85

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !86
  store i32* %arraydecay, i32** %data, align 8, !dbg !88
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !89, metadata !DIExpression()), !dbg !91
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !91
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !91
  %2 = load i32*, i32** %data, align 8, !dbg !92
  %3 = bitcast i32* %2 to i8*, !dbg !93
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !93
  %4 = bitcast i32* %arraydecay1 to i8*, !dbg !93
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !93
  %5 = load i32*, i32** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !94
  %6 = load i32, i32* %arrayidx, align 4, !dbg !94
  call void @printIntLine(i32 %6), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !97 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %0 = load i32, i32* @staticFive, align 4, !dbg !104
  %cmp = icmp eq i32 %0, 5, !dbg !106
  br i1 %cmp, label %if.then, label %if.end, !dbg !107

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !108
  store i32* %arraydecay, i32** %data, align 8, !dbg !110
  br label %if.end, !dbg !111

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !112, metadata !DIExpression()), !dbg !114
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !114
  %2 = load i32*, i32** %data, align 8, !dbg !115
  %3 = bitcast i32* %2 to i8*, !dbg !116
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !116
  %4 = bitcast i32* %arraydecay1 to i8*, !dbg !116
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !116
  %5 = load i32*, i32** %data, align 8, !dbg !117
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !117
  %6 = load i32, i32* %arrayidx, align 4, !dbg !117
  call void @printIntLine(i32 %6), !dbg !118
  ret void, !dbg !119
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 23, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_07.c", directory: "/root/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_07_bad", scope: !8, file: !8, line: 27, type: !17, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 29, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!21 = !DILocation(line: 29, column: 11, scope: !16)
!22 = !DILocalVariable(name: "dataBadBuffer", scope: !16, file: !8, line: 30, type: !23)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 1600, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 50)
!26 = !DILocation(line: 30, column: 9, scope: !16)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !16, file: !8, line: 31, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 3200, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 31, column: 9, scope: !16)
!32 = !DILocation(line: 32, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !16, file: !8, line: 32, column: 8)
!34 = !DILocation(line: 32, column: 18, scope: !33)
!35 = !DILocation(line: 32, column: 8, scope: !16)
!36 = !DILocation(line: 36, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !8, line: 33, column: 5)
!38 = !DILocation(line: 36, column: 14, scope: !37)
!39 = !DILocation(line: 37, column: 5, scope: !37)
!40 = !DILocalVariable(name: "source", scope: !41, file: !8, line: 39, type: !28)
!41 = distinct !DILexicalBlock(scope: !16, file: !8, line: 38, column: 5)
!42 = !DILocation(line: 39, column: 13, scope: !41)
!43 = !DILocation(line: 41, column: 16, scope: !41)
!44 = !DILocation(line: 41, column: 9, scope: !41)
!45 = !DILocation(line: 42, column: 22, scope: !41)
!46 = !DILocation(line: 42, column: 9, scope: !41)
!47 = !DILocation(line: 44, column: 1, scope: !16)
!48 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_07_good", scope: !8, file: !8, line: 93, type: !17, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!49 = !DILocation(line: 95, column: 5, scope: !48)
!50 = !DILocation(line: 96, column: 5, scope: !48)
!51 = !DILocation(line: 97, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 109, type: !53, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!53 = !DISubroutineType(types: !54)
!54 = !{!9, !9, !55}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !8, line: 109, type: !9)
!59 = !DILocation(line: 109, column: 14, scope: !52)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !8, line: 109, type: !55)
!61 = !DILocation(line: 109, column: 27, scope: !52)
!62 = !DILocation(line: 112, column: 22, scope: !52)
!63 = !DILocation(line: 112, column: 12, scope: !52)
!64 = !DILocation(line: 112, column: 5, scope: !52)
!65 = !DILocation(line: 114, column: 5, scope: !52)
!66 = !DILocation(line: 115, column: 5, scope: !52)
!67 = !DILocation(line: 116, column: 5, scope: !52)
!68 = !DILocation(line: 119, column: 5, scope: !52)
!69 = !DILocation(line: 120, column: 5, scope: !52)
!70 = !DILocation(line: 121, column: 5, scope: !52)
!71 = !DILocation(line: 123, column: 5, scope: !52)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 51, type: !17, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!73 = !DILocalVariable(name: "data", scope: !72, file: !8, line: 53, type: !20)
!74 = !DILocation(line: 53, column: 11, scope: !72)
!75 = !DILocalVariable(name: "dataBadBuffer", scope: !72, file: !8, line: 54, type: !23)
!76 = !DILocation(line: 54, column: 9, scope: !72)
!77 = !DILocalVariable(name: "dataGoodBuffer", scope: !72, file: !8, line: 55, type: !28)
!78 = !DILocation(line: 55, column: 9, scope: !72)
!79 = !DILocation(line: 56, column: 8, scope: !80)
!80 = distinct !DILexicalBlock(scope: !72, file: !8, line: 56, column: 8)
!81 = !DILocation(line: 56, column: 18, scope: !80)
!82 = !DILocation(line: 56, column: 8, scope: !72)
!83 = !DILocation(line: 59, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !8, line: 57, column: 5)
!85 = !DILocation(line: 60, column: 5, scope: !84)
!86 = !DILocation(line: 64, column: 16, scope: !87)
!87 = distinct !DILexicalBlock(scope: !80, file: !8, line: 62, column: 5)
!88 = !DILocation(line: 64, column: 14, scope: !87)
!89 = !DILocalVariable(name: "source", scope: !90, file: !8, line: 67, type: !28)
!90 = distinct !DILexicalBlock(scope: !72, file: !8, line: 66, column: 5)
!91 = !DILocation(line: 67, column: 13, scope: !90)
!92 = !DILocation(line: 69, column: 16, scope: !90)
!93 = !DILocation(line: 69, column: 9, scope: !90)
!94 = !DILocation(line: 70, column: 22, scope: !90)
!95 = !DILocation(line: 70, column: 9, scope: !90)
!96 = !DILocation(line: 72, column: 1, scope: !72)
!97 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 75, type: !17, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!98 = !DILocalVariable(name: "data", scope: !97, file: !8, line: 77, type: !20)
!99 = !DILocation(line: 77, column: 11, scope: !97)
!100 = !DILocalVariable(name: "dataBadBuffer", scope: !97, file: !8, line: 78, type: !23)
!101 = !DILocation(line: 78, column: 9, scope: !97)
!102 = !DILocalVariable(name: "dataGoodBuffer", scope: !97, file: !8, line: 79, type: !28)
!103 = !DILocation(line: 79, column: 9, scope: !97)
!104 = !DILocation(line: 80, column: 8, scope: !105)
!105 = distinct !DILexicalBlock(scope: !97, file: !8, line: 80, column: 8)
!106 = !DILocation(line: 80, column: 18, scope: !105)
!107 = !DILocation(line: 80, column: 8, scope: !97)
!108 = !DILocation(line: 83, column: 16, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !8, line: 81, column: 5)
!110 = !DILocation(line: 83, column: 14, scope: !109)
!111 = !DILocation(line: 84, column: 5, scope: !109)
!112 = !DILocalVariable(name: "source", scope: !113, file: !8, line: 86, type: !28)
!113 = distinct !DILexicalBlock(scope: !97, file: !8, line: 85, column: 5)
!114 = !DILocation(line: 86, column: 13, scope: !113)
!115 = !DILocation(line: 88, column: 16, scope: !113)
!116 = !DILocation(line: 88, column: 9, scope: !113)
!117 = !DILocation(line: 89, column: 22, scope: !113)
!118 = !DILocation(line: 89, column: 9, scope: !113)
!119 = !DILocation(line: 91, column: 1, scope: !97)
