; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_14.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_14_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_14_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %0 = load i32, i32* @globalFive, align 4, !dbg !29
  %cmp = icmp eq i32 %0, 5, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !33
  store i8* %arraydecay, i8** %data, align 8, !dbg !35
  %1 = load i8*, i8** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !39, metadata !DIExpression()), !dbg !41
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !41
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_14_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !41
  %3 = load i8*, i8** %data, align 8, !dbg !42
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !43
  %call = call i8* @strcpy(i8* %3, i8* %arraydecay1) #5, !dbg !44
  %4 = load i8*, i8** %data, align 8, !dbg !45
  call void @printLine(i8* %4), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_14_good() #0 !dbg !48 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* null) #5, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #5, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_14_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_14_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !71 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %0 = load i32, i32* @globalFive, align 4, !dbg !78
  %cmp = icmp ne i32 %0, 5, !dbg !80
  br i1 %cmp, label %if.then, label %if.else, !dbg !81

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !82
  br label %if.end, !dbg !84

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !85
  store i8* %arraydecay, i8** %data, align 8, !dbg !87
  %1 = load i8*, i8** %data, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !88
  store i8 0, i8* %arrayidx, align 1, !dbg !89
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !90, metadata !DIExpression()), !dbg !92
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !92
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !92
  %3 = load i8*, i8** %data, align 8, !dbg !93
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !94
  %call = call i8* @strcpy(i8* %3, i8* %arraydecay1) #5, !dbg !95
  %4 = load i8*, i8** %data, align 8, !dbg !96
  call void @printLine(i8* %4), !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !99 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %0 = load i32, i32* @globalFive, align 4, !dbg !106
  %cmp = icmp eq i32 %0, 5, !dbg !108
  br i1 %cmp, label %if.then, label %if.end, !dbg !109

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !110
  store i8* %arraydecay, i8** %data, align 8, !dbg !112
  %1 = load i8*, i8** %data, align 8, !dbg !113
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !113
  store i8 0, i8* %arrayidx, align 1, !dbg !114
  br label %if.end, !dbg !115

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !116, metadata !DIExpression()), !dbg !118
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !118
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !118
  %3 = load i8*, i8** %data, align 8, !dbg !119
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !120
  %call = call i8* @strcpy(i8* %3, i8* %arraydecay1) #5, !dbg !121
  %4 = load i8*, i8** %data, align 8, !dbg !122
  call void @printLine(i8* %4), !dbg !123
  ret void, !dbg !124
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_14.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_14_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_14.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 30, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 80, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 10)
!23 = !DILocation(line: 31, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 88, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 11)
!28 = !DILocation(line: 32, column: 10, scope: !11)
!29 = !DILocation(line: 33, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 8)
!31 = !DILocation(line: 33, column: 18, scope: !30)
!32 = !DILocation(line: 33, column: 8, scope: !11)
!33 = !DILocation(line: 37, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !12, line: 34, column: 5)
!35 = !DILocation(line: 37, column: 14, scope: !34)
!36 = !DILocation(line: 38, column: 9, scope: !34)
!37 = !DILocation(line: 38, column: 17, scope: !34)
!38 = !DILocation(line: 39, column: 5, scope: !34)
!39 = !DILocalVariable(name: "source", scope: !40, file: !12, line: 41, type: !25)
!40 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!41 = !DILocation(line: 41, column: 14, scope: !40)
!42 = !DILocation(line: 43, column: 16, scope: !40)
!43 = !DILocation(line: 43, column: 22, scope: !40)
!44 = !DILocation(line: 43, column: 9, scope: !40)
!45 = !DILocation(line: 44, column: 19, scope: !40)
!46 = !DILocation(line: 44, column: 9, scope: !40)
!47 = !DILocation(line: 46, column: 1, scope: !11)
!48 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_14_good", scope: !12, file: !12, line: 99, type: !13, scopeLine: 100, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 101, column: 5, scope: !48)
!50 = !DILocation(line: 102, column: 5, scope: !48)
!51 = !DILocation(line: 103, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 115, type: !53, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!55, !55, !56}
!55 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !12, line: 115, type: !55)
!58 = !DILocation(line: 115, column: 14, scope: !52)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !12, line: 115, type: !56)
!60 = !DILocation(line: 115, column: 27, scope: !52)
!61 = !DILocation(line: 118, column: 22, scope: !52)
!62 = !DILocation(line: 118, column: 12, scope: !52)
!63 = !DILocation(line: 118, column: 5, scope: !52)
!64 = !DILocation(line: 120, column: 5, scope: !52)
!65 = !DILocation(line: 121, column: 5, scope: !52)
!66 = !DILocation(line: 122, column: 5, scope: !52)
!67 = !DILocation(line: 125, column: 5, scope: !52)
!68 = !DILocation(line: 126, column: 5, scope: !52)
!69 = !DILocation(line: 127, column: 5, scope: !52)
!70 = !DILocation(line: 129, column: 5, scope: !52)
!71 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 53, type: !13, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "data", scope: !71, file: !12, line: 55, type: !16)
!73 = !DILocation(line: 55, column: 12, scope: !71)
!74 = !DILocalVariable(name: "dataBadBuffer", scope: !71, file: !12, line: 56, type: !20)
!75 = !DILocation(line: 56, column: 10, scope: !71)
!76 = !DILocalVariable(name: "dataGoodBuffer", scope: !71, file: !12, line: 57, type: !25)
!77 = !DILocation(line: 57, column: 10, scope: !71)
!78 = !DILocation(line: 58, column: 8, scope: !79)
!79 = distinct !DILexicalBlock(scope: !71, file: !12, line: 58, column: 8)
!80 = !DILocation(line: 58, column: 18, scope: !79)
!81 = !DILocation(line: 58, column: 8, scope: !71)
!82 = !DILocation(line: 61, column: 9, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !12, line: 59, column: 5)
!84 = !DILocation(line: 62, column: 5, scope: !83)
!85 = !DILocation(line: 67, column: 16, scope: !86)
!86 = distinct !DILexicalBlock(scope: !79, file: !12, line: 64, column: 5)
!87 = !DILocation(line: 67, column: 14, scope: !86)
!88 = !DILocation(line: 68, column: 9, scope: !86)
!89 = !DILocation(line: 68, column: 17, scope: !86)
!90 = !DILocalVariable(name: "source", scope: !91, file: !12, line: 71, type: !25)
!91 = distinct !DILexicalBlock(scope: !71, file: !12, line: 70, column: 5)
!92 = !DILocation(line: 71, column: 14, scope: !91)
!93 = !DILocation(line: 73, column: 16, scope: !91)
!94 = !DILocation(line: 73, column: 22, scope: !91)
!95 = !DILocation(line: 73, column: 9, scope: !91)
!96 = !DILocation(line: 74, column: 19, scope: !91)
!97 = !DILocation(line: 74, column: 9, scope: !91)
!98 = !DILocation(line: 76, column: 1, scope: !71)
!99 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 79, type: !13, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !12, line: 81, type: !16)
!101 = !DILocation(line: 81, column: 12, scope: !99)
!102 = !DILocalVariable(name: "dataBadBuffer", scope: !99, file: !12, line: 82, type: !20)
!103 = !DILocation(line: 82, column: 10, scope: !99)
!104 = !DILocalVariable(name: "dataGoodBuffer", scope: !99, file: !12, line: 83, type: !25)
!105 = !DILocation(line: 83, column: 10, scope: !99)
!106 = !DILocation(line: 84, column: 8, scope: !107)
!107 = distinct !DILexicalBlock(scope: !99, file: !12, line: 84, column: 8)
!108 = !DILocation(line: 84, column: 18, scope: !107)
!109 = !DILocation(line: 84, column: 8, scope: !99)
!110 = !DILocation(line: 88, column: 16, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !12, line: 85, column: 5)
!112 = !DILocation(line: 88, column: 14, scope: !111)
!113 = !DILocation(line: 89, column: 9, scope: !111)
!114 = !DILocation(line: 89, column: 17, scope: !111)
!115 = !DILocation(line: 90, column: 5, scope: !111)
!116 = !DILocalVariable(name: "source", scope: !117, file: !12, line: 92, type: !25)
!117 = distinct !DILexicalBlock(scope: !99, file: !12, line: 91, column: 5)
!118 = !DILocation(line: 92, column: 14, scope: !117)
!119 = !DILocation(line: 94, column: 16, scope: !117)
!120 = !DILocation(line: 94, column: 22, scope: !117)
!121 = !DILocation(line: 94, column: 9, scope: !117)
!122 = !DILocation(line: 95, column: 19, scope: !117)
!123 = !DILocation(line: 95, column: 9, scope: !117)
!124 = !DILocation(line: 97, column: 1, scope: !99)
