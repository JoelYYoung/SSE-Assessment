; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_01.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_01_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_01_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !29
  store i8* %arraydecay, i8** %data, align 8, !dbg !30
  %0 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !33, metadata !DIExpression()), !dbg !35
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !35
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_01_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !35
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !41, metadata !DIExpression()), !dbg !42
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !43
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !44
  store i64 %call, i64* %sourceLen, align 8, !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !49
  %3 = load i64, i64* %sourceLen, align 8, !dbg !51
  %add = add i64 %3, 1, !dbg !52
  %cmp = icmp ult i64 %2, %add, !dbg !53
  br i1 %cmp, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !57
  %5 = load i8, i8* %arrayidx2, align 1, !dbg !57
  %6 = load i8*, i8** %data, align 8, !dbg !58
  %7 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !58
  store i8 %5, i8* %arrayidx3, align 1, !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !62
  %inc = add i64 %8, 1, !dbg !62
  store i64 %inc, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !67
  call void @printLine(i8* %9), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_01_good() #0 !dbg !70 {
entry:
  call void @goodG2B(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* null) #7, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #7, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_01_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_01_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !92 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !99
  store i8* %arraydecay, i8** %data, align 8, !dbg !100
  %0 = load i8*, i8** %data, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !101
  store i8 0, i8* %arrayidx, align 1, !dbg !102
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !103, metadata !DIExpression()), !dbg !105
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !105
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !105
  call void @llvm.dbg.declare(metadata i64* %i, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !108, metadata !DIExpression()), !dbg !109
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !110
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !111
  store i64 %call, i64* %sourceLen, align 8, !dbg !112
  store i64 0, i64* %i, align 8, !dbg !113
  br label %for.cond, !dbg !115

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !116
  %3 = load i64, i64* %sourceLen, align 8, !dbg !118
  %add = add i64 %3, 1, !dbg !119
  %cmp = icmp ult i64 %2, %add, !dbg !120
  br i1 %cmp, label %for.body, label %for.end, !dbg !121

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !122
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !124
  %5 = load i8, i8* %arrayidx2, align 1, !dbg !124
  %6 = load i8*, i8** %data, align 8, !dbg !125
  %7 = load i64, i64* %i, align 8, !dbg !126
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !125
  store i8 %5, i8* %arrayidx3, align 1, !dbg !127
  br label %for.inc, !dbg !128

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !129
  %inc = add i64 %8, 1, !dbg !129
  store i64 %inc, i64* %i, align 8, !dbg !129
  br label %for.cond, !dbg !130, !llvm.loop !131

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !133
  call void @printLine(i8* %9), !dbg !134
  ret void, !dbg !135
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_01.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_01_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_01.c", directory: "/root/SSE-Assessment")
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
!29 = !DILocation(line: 35, column: 12, scope: !11)
!30 = !DILocation(line: 35, column: 10, scope: !11)
!31 = !DILocation(line: 36, column: 5, scope: !11)
!32 = !DILocation(line: 36, column: 13, scope: !11)
!33 = !DILocalVariable(name: "source", scope: !34, file: !12, line: 38, type: !25)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!35 = !DILocation(line: 38, column: 14, scope: !34)
!36 = !DILocalVariable(name: "i", scope: !34, file: !12, line: 39, type: !37)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !38, line: 46, baseType: !39)
!38 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!39 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocation(line: 39, column: 16, scope: !34)
!41 = !DILocalVariable(name: "sourceLen", scope: !34, file: !12, line: 39, type: !37)
!42 = !DILocation(line: 39, column: 19, scope: !34)
!43 = !DILocation(line: 40, column: 28, scope: !34)
!44 = !DILocation(line: 40, column: 21, scope: !34)
!45 = !DILocation(line: 40, column: 19, scope: !34)
!46 = !DILocation(line: 43, column: 16, scope: !47)
!47 = distinct !DILexicalBlock(scope: !34, file: !12, line: 43, column: 9)
!48 = !DILocation(line: 43, column: 14, scope: !47)
!49 = !DILocation(line: 43, column: 21, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !12, line: 43, column: 9)
!51 = !DILocation(line: 43, column: 25, scope: !50)
!52 = !DILocation(line: 43, column: 35, scope: !50)
!53 = !DILocation(line: 43, column: 23, scope: !50)
!54 = !DILocation(line: 43, column: 9, scope: !47)
!55 = !DILocation(line: 45, column: 30, scope: !56)
!56 = distinct !DILexicalBlock(scope: !50, file: !12, line: 44, column: 9)
!57 = !DILocation(line: 45, column: 23, scope: !56)
!58 = !DILocation(line: 45, column: 13, scope: !56)
!59 = !DILocation(line: 45, column: 18, scope: !56)
!60 = !DILocation(line: 45, column: 21, scope: !56)
!61 = !DILocation(line: 46, column: 9, scope: !56)
!62 = !DILocation(line: 43, column: 41, scope: !50)
!63 = !DILocation(line: 43, column: 9, scope: !50)
!64 = distinct !{!64, !54, !65, !66}
!65 = !DILocation(line: 46, column: 9, scope: !47)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 47, column: 19, scope: !34)
!68 = !DILocation(line: 47, column: 9, scope: !34)
!69 = !DILocation(line: 49, column: 1, scope: !11)
!70 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_01_good", scope: !12, file: !12, line: 79, type: !13, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 81, column: 5, scope: !70)
!72 = !DILocation(line: 82, column: 1, scope: !70)
!73 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 94, type: !74, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!76, !76, !77}
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !12, line: 94, type: !76)
!79 = !DILocation(line: 94, column: 14, scope: !73)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !12, line: 94, type: !77)
!81 = !DILocation(line: 94, column: 27, scope: !73)
!82 = !DILocation(line: 97, column: 22, scope: !73)
!83 = !DILocation(line: 97, column: 12, scope: !73)
!84 = !DILocation(line: 97, column: 5, scope: !73)
!85 = !DILocation(line: 99, column: 5, scope: !73)
!86 = !DILocation(line: 100, column: 5, scope: !73)
!87 = !DILocation(line: 101, column: 5, scope: !73)
!88 = !DILocation(line: 104, column: 5, scope: !73)
!89 = !DILocation(line: 105, column: 5, scope: !73)
!90 = !DILocation(line: 106, column: 5, scope: !73)
!91 = !DILocation(line: 108, column: 5, scope: !73)
!92 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 56, type: !13, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "data", scope: !92, file: !12, line: 58, type: !16)
!94 = !DILocation(line: 58, column: 12, scope: !92)
!95 = !DILocalVariable(name: "dataBadBuffer", scope: !92, file: !12, line: 59, type: !20)
!96 = !DILocation(line: 59, column: 10, scope: !92)
!97 = !DILocalVariable(name: "dataGoodBuffer", scope: !92, file: !12, line: 60, type: !25)
!98 = !DILocation(line: 60, column: 10, scope: !92)
!99 = !DILocation(line: 63, column: 12, scope: !92)
!100 = !DILocation(line: 63, column: 10, scope: !92)
!101 = !DILocation(line: 64, column: 5, scope: !92)
!102 = !DILocation(line: 64, column: 13, scope: !92)
!103 = !DILocalVariable(name: "source", scope: !104, file: !12, line: 66, type: !25)
!104 = distinct !DILexicalBlock(scope: !92, file: !12, line: 65, column: 5)
!105 = !DILocation(line: 66, column: 14, scope: !104)
!106 = !DILocalVariable(name: "i", scope: !104, file: !12, line: 67, type: !37)
!107 = !DILocation(line: 67, column: 16, scope: !104)
!108 = !DILocalVariable(name: "sourceLen", scope: !104, file: !12, line: 67, type: !37)
!109 = !DILocation(line: 67, column: 19, scope: !104)
!110 = !DILocation(line: 68, column: 28, scope: !104)
!111 = !DILocation(line: 68, column: 21, scope: !104)
!112 = !DILocation(line: 68, column: 19, scope: !104)
!113 = !DILocation(line: 71, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !104, file: !12, line: 71, column: 9)
!115 = !DILocation(line: 71, column: 14, scope: !114)
!116 = !DILocation(line: 71, column: 21, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !12, line: 71, column: 9)
!118 = !DILocation(line: 71, column: 25, scope: !117)
!119 = !DILocation(line: 71, column: 35, scope: !117)
!120 = !DILocation(line: 71, column: 23, scope: !117)
!121 = !DILocation(line: 71, column: 9, scope: !114)
!122 = !DILocation(line: 73, column: 30, scope: !123)
!123 = distinct !DILexicalBlock(scope: !117, file: !12, line: 72, column: 9)
!124 = !DILocation(line: 73, column: 23, scope: !123)
!125 = !DILocation(line: 73, column: 13, scope: !123)
!126 = !DILocation(line: 73, column: 18, scope: !123)
!127 = !DILocation(line: 73, column: 21, scope: !123)
!128 = !DILocation(line: 74, column: 9, scope: !123)
!129 = !DILocation(line: 71, column: 41, scope: !117)
!130 = !DILocation(line: 71, column: 9, scope: !117)
!131 = distinct !{!131, !121, !132, !66}
!132 = !DILocation(line: 74, column: 9, scope: !114)
!133 = !DILocation(line: 75, column: 19, scope: !104)
!134 = !DILocation(line: 75, column: 9, scope: !104)
!135 = !DILocation(line: 77, column: 1, scope: !92)
