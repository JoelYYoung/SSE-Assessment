; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_31_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_31_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 10, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 11, align 16, !dbg !24
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !23
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !25
  store i8* %2, i8** %data, align 8, !dbg !26
  %3 = load i8*, i8** %data, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !29, metadata !DIExpression()), !dbg !31
  %4 = load i8*, i8** %data, align 8, !dbg !32
  store i8* %4, i8** %dataCopy, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !33, metadata !DIExpression()), !dbg !34
  %5 = load i8*, i8** %dataCopy, align 8, !dbg !35
  store i8* %5, i8** %data1, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !36, metadata !DIExpression()), !dbg !41
  %6 = bitcast [11 x i8]* %source to i8*, !dbg !41
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_31_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !47, metadata !DIExpression()), !dbg !48
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !49
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !50
  store i64 %call, i64* %sourceLen, align 8, !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !55
  %8 = load i64, i64* %sourceLen, align 8, !dbg !57
  %add = add i64 %8, 1, !dbg !58
  %cmp = icmp ult i64 %7, %add, !dbg !59
  br i1 %cmp, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %9, !dbg !63
  %10 = load i8, i8* %arrayidx2, align 1, !dbg !63
  %11 = load i8*, i8** %data1, align 8, !dbg !64
  %12 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx3 = getelementptr inbounds i8, i8* %11, i64 %12, !dbg !64
  store i8 %10, i8* %arrayidx3, align 1, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %13, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  %14 = load i8*, i8** %data1, align 8, !dbg !73
  call void @printLine(i8* %14), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_31_good() #0 !dbg !76 {
entry:
  call void @goodG2B(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* null) #7, !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 %conv) #7, !dbg !90
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_31_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_31_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !98 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %0 = alloca i8, i64 10, align 16, !dbg !103
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %1 = alloca i8, i64 11, align 16, !dbg !106
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !105
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !107
  store i8* %2, i8** %data, align 8, !dbg !108
  %3 = load i8*, i8** %data, align 8, !dbg !109
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !109
  store i8 0, i8* %arrayidx, align 1, !dbg !110
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !111, metadata !DIExpression()), !dbg !113
  %4 = load i8*, i8** %data, align 8, !dbg !114
  store i8* %4, i8** %dataCopy, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !115, metadata !DIExpression()), !dbg !116
  %5 = load i8*, i8** %dataCopy, align 8, !dbg !117
  store i8* %5, i8** %data1, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !118, metadata !DIExpression()), !dbg !120
  %6 = bitcast [11 x i8]* %source to i8*, !dbg !120
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !120
  call void @llvm.dbg.declare(metadata i64* %i, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !123, metadata !DIExpression()), !dbg !124
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !125
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !126
  store i64 %call, i64* %sourceLen, align 8, !dbg !127
  store i64 0, i64* %i, align 8, !dbg !128
  br label %for.cond, !dbg !130

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !131
  %8 = load i64, i64* %sourceLen, align 8, !dbg !133
  %add = add i64 %8, 1, !dbg !134
  %cmp = icmp ult i64 %7, %add, !dbg !135
  br i1 %cmp, label %for.body, label %for.end, !dbg !136

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %9, !dbg !139
  %10 = load i8, i8* %arrayidx2, align 1, !dbg !139
  %11 = load i8*, i8** %data1, align 8, !dbg !140
  %12 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx3 = getelementptr inbounds i8, i8* %11, i64 %12, !dbg !140
  store i8 %10, i8* %arrayidx3, align 1, !dbg !142
  br label %for.inc, !dbg !143

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !144
  %inc = add i64 %13, 1, !dbg !144
  store i64 %inc, i64* %i, align 8, !dbg !144
  br label %for.cond, !dbg !145, !llvm.loop !146

for.end:                                          ; preds = %for.cond
  %14 = load i8*, i8** %data1, align 8, !dbg !148
  call void @printLine(i8* %14), !dbg !149
  ret void, !dbg !150
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
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_31.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_31_bad", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_31.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 30, type: !4)
!18 = !DILocation(line: 30, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 31, type: !4)
!20 = !DILocation(line: 31, column: 12, scope: !13)
!21 = !DILocation(line: 31, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 32, type: !4)
!23 = !DILocation(line: 32, column: 12, scope: !13)
!24 = !DILocation(line: 32, column: 37, scope: !13)
!25 = !DILocation(line: 35, column: 12, scope: !13)
!26 = !DILocation(line: 35, column: 10, scope: !13)
!27 = !DILocation(line: 36, column: 5, scope: !13)
!28 = !DILocation(line: 36, column: 13, scope: !13)
!29 = !DILocalVariable(name: "dataCopy", scope: !30, file: !14, line: 38, type: !4)
!30 = distinct !DILexicalBlock(scope: !13, file: !14, line: 37, column: 5)
!31 = !DILocation(line: 38, column: 16, scope: !30)
!32 = !DILocation(line: 38, column: 27, scope: !30)
!33 = !DILocalVariable(name: "data", scope: !30, file: !14, line: 39, type: !4)
!34 = !DILocation(line: 39, column: 16, scope: !30)
!35 = !DILocation(line: 39, column: 23, scope: !30)
!36 = !DILocalVariable(name: "source", scope: !37, file: !14, line: 41, type: !38)
!37 = distinct !DILexicalBlock(scope: !30, file: !14, line: 40, column: 9)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 11)
!41 = !DILocation(line: 41, column: 18, scope: !37)
!42 = !DILocalVariable(name: "i", scope: !37, file: !14, line: 42, type: !43)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !44, line: 46, baseType: !45)
!44 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!45 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 42, column: 20, scope: !37)
!47 = !DILocalVariable(name: "sourceLen", scope: !37, file: !14, line: 42, type: !43)
!48 = !DILocation(line: 42, column: 23, scope: !37)
!49 = !DILocation(line: 43, column: 32, scope: !37)
!50 = !DILocation(line: 43, column: 25, scope: !37)
!51 = !DILocation(line: 43, column: 23, scope: !37)
!52 = !DILocation(line: 46, column: 20, scope: !53)
!53 = distinct !DILexicalBlock(scope: !37, file: !14, line: 46, column: 13)
!54 = !DILocation(line: 46, column: 18, scope: !53)
!55 = !DILocation(line: 46, column: 25, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !14, line: 46, column: 13)
!57 = !DILocation(line: 46, column: 29, scope: !56)
!58 = !DILocation(line: 46, column: 39, scope: !56)
!59 = !DILocation(line: 46, column: 27, scope: !56)
!60 = !DILocation(line: 46, column: 13, scope: !53)
!61 = !DILocation(line: 48, column: 34, scope: !62)
!62 = distinct !DILexicalBlock(scope: !56, file: !14, line: 47, column: 13)
!63 = !DILocation(line: 48, column: 27, scope: !62)
!64 = !DILocation(line: 48, column: 17, scope: !62)
!65 = !DILocation(line: 48, column: 22, scope: !62)
!66 = !DILocation(line: 48, column: 25, scope: !62)
!67 = !DILocation(line: 49, column: 13, scope: !62)
!68 = !DILocation(line: 46, column: 45, scope: !56)
!69 = !DILocation(line: 46, column: 13, scope: !56)
!70 = distinct !{!70, !60, !71, !72}
!71 = !DILocation(line: 49, column: 13, scope: !53)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 50, column: 23, scope: !37)
!74 = !DILocation(line: 50, column: 13, scope: !37)
!75 = !DILocation(line: 53, column: 1, scope: !13)
!76 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_31_good", scope: !14, file: !14, line: 87, type: !15, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocation(line: 89, column: 5, scope: !76)
!78 = !DILocation(line: 90, column: 1, scope: !76)
!79 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 101, type: !80, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!82, !82, !83}
!82 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !14, line: 101, type: !82)
!85 = !DILocation(line: 101, column: 14, scope: !79)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !14, line: 101, type: !83)
!87 = !DILocation(line: 101, column: 27, scope: !79)
!88 = !DILocation(line: 104, column: 22, scope: !79)
!89 = !DILocation(line: 104, column: 12, scope: !79)
!90 = !DILocation(line: 104, column: 5, scope: !79)
!91 = !DILocation(line: 106, column: 5, scope: !79)
!92 = !DILocation(line: 107, column: 5, scope: !79)
!93 = !DILocation(line: 108, column: 5, scope: !79)
!94 = !DILocation(line: 111, column: 5, scope: !79)
!95 = !DILocation(line: 112, column: 5, scope: !79)
!96 = !DILocation(line: 113, column: 5, scope: !79)
!97 = !DILocation(line: 115, column: 5, scope: !79)
!98 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 60, type: !15, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !14, line: 62, type: !4)
!100 = !DILocation(line: 62, column: 12, scope: !98)
!101 = !DILocalVariable(name: "dataBadBuffer", scope: !98, file: !14, line: 63, type: !4)
!102 = !DILocation(line: 63, column: 12, scope: !98)
!103 = !DILocation(line: 63, column: 36, scope: !98)
!104 = !DILocalVariable(name: "dataGoodBuffer", scope: !98, file: !14, line: 64, type: !4)
!105 = !DILocation(line: 64, column: 12, scope: !98)
!106 = !DILocation(line: 64, column: 37, scope: !98)
!107 = !DILocation(line: 67, column: 12, scope: !98)
!108 = !DILocation(line: 67, column: 10, scope: !98)
!109 = !DILocation(line: 68, column: 5, scope: !98)
!110 = !DILocation(line: 68, column: 13, scope: !98)
!111 = !DILocalVariable(name: "dataCopy", scope: !112, file: !14, line: 70, type: !4)
!112 = distinct !DILexicalBlock(scope: !98, file: !14, line: 69, column: 5)
!113 = !DILocation(line: 70, column: 16, scope: !112)
!114 = !DILocation(line: 70, column: 27, scope: !112)
!115 = !DILocalVariable(name: "data", scope: !112, file: !14, line: 71, type: !4)
!116 = !DILocation(line: 71, column: 16, scope: !112)
!117 = !DILocation(line: 71, column: 23, scope: !112)
!118 = !DILocalVariable(name: "source", scope: !119, file: !14, line: 73, type: !38)
!119 = distinct !DILexicalBlock(scope: !112, file: !14, line: 72, column: 9)
!120 = !DILocation(line: 73, column: 18, scope: !119)
!121 = !DILocalVariable(name: "i", scope: !119, file: !14, line: 74, type: !43)
!122 = !DILocation(line: 74, column: 20, scope: !119)
!123 = !DILocalVariable(name: "sourceLen", scope: !119, file: !14, line: 74, type: !43)
!124 = !DILocation(line: 74, column: 23, scope: !119)
!125 = !DILocation(line: 75, column: 32, scope: !119)
!126 = !DILocation(line: 75, column: 25, scope: !119)
!127 = !DILocation(line: 75, column: 23, scope: !119)
!128 = !DILocation(line: 78, column: 20, scope: !129)
!129 = distinct !DILexicalBlock(scope: !119, file: !14, line: 78, column: 13)
!130 = !DILocation(line: 78, column: 18, scope: !129)
!131 = !DILocation(line: 78, column: 25, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !14, line: 78, column: 13)
!133 = !DILocation(line: 78, column: 29, scope: !132)
!134 = !DILocation(line: 78, column: 39, scope: !132)
!135 = !DILocation(line: 78, column: 27, scope: !132)
!136 = !DILocation(line: 78, column: 13, scope: !129)
!137 = !DILocation(line: 80, column: 34, scope: !138)
!138 = distinct !DILexicalBlock(scope: !132, file: !14, line: 79, column: 13)
!139 = !DILocation(line: 80, column: 27, scope: !138)
!140 = !DILocation(line: 80, column: 17, scope: !138)
!141 = !DILocation(line: 80, column: 22, scope: !138)
!142 = !DILocation(line: 80, column: 25, scope: !138)
!143 = !DILocation(line: 81, column: 13, scope: !138)
!144 = !DILocation(line: 78, column: 45, scope: !132)
!145 = !DILocation(line: 78, column: 13, scope: !132)
!146 = distinct !{!146, !136, !147, !72}
!147 = !DILocation(line: 81, column: 13, scope: !129)
!148 = !DILocation(line: 82, column: 23, scope: !119)
!149 = !DILocation(line: 82, column: 13, scope: !119)
!150 = !DILocation(line: 85, column: 1, scope: !98)
