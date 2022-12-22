; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_41_badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_41_goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_41_badSink(i8* %data) #0 !dbg !13 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !19, metadata !DIExpression()), !dbg !24
  %0 = bitcast [11 x i8]* %source to i8*, !dbg !24
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_41_badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !24
  call void @llvm.dbg.declare(metadata i64* %i, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !30, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !32
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !33
  store i64 %call, i64* %sourceLen, align 8, !dbg !34
  store i64 0, i64* %i, align 8, !dbg !35
  br label %for.cond, !dbg !37

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !38
  %2 = load i64, i64* %sourceLen, align 8, !dbg !40
  %add = add i64 %2, 1, !dbg !41
  %cmp = icmp ult i64 %1, %add, !dbg !42
  br i1 %cmp, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !44
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %3, !dbg !46
  %4 = load i8, i8* %arrayidx, align 1, !dbg !46
  %5 = load i8*, i8** %data.addr, align 8, !dbg !47
  %6 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !47
  store i8 %4, i8* %arrayidx1, align 1, !dbg !49
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !51
  %inc = add i64 %7, 1, !dbg !51
  store i64 %inc, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !52, !llvm.loop !53

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data.addr, align 8, !dbg !56
  call void @printLine(i8* %8), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_41_bad() #0 !dbg !59 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !64, metadata !DIExpression()), !dbg !65
  %0 = alloca i8, i64 10, align 16, !dbg !66
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !67, metadata !DIExpression()), !dbg !68
  %1 = alloca i8, i64 11, align 16, !dbg !69
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !68
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !70
  store i8* %2, i8** %data, align 8, !dbg !71
  %3 = load i8*, i8** %data, align 8, !dbg !72
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !72
  store i8 0, i8* %arrayidx, align 1, !dbg !73
  %4 = load i8*, i8** %data, align 8, !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_41_badSink(i8* %4), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_41_goodG2BSink(i8* %data) #0 !dbg !77 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !80, metadata !DIExpression()), !dbg !82
  %0 = bitcast [11 x i8]* %source to i8*, !dbg !82
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_41_goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !82
  call void @llvm.dbg.declare(metadata i64* %i, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !85, metadata !DIExpression()), !dbg !86
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !87
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !88
  store i64 %call, i64* %sourceLen, align 8, !dbg !89
  store i64 0, i64* %i, align 8, !dbg !90
  br label %for.cond, !dbg !92

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !93
  %2 = load i64, i64* %sourceLen, align 8, !dbg !95
  %add = add i64 %2, 1, !dbg !96
  %cmp = icmp ult i64 %1, %add, !dbg !97
  br i1 %cmp, label %for.body, label %for.end, !dbg !98

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !99
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %3, !dbg !101
  %4 = load i8, i8* %arrayidx, align 1, !dbg !101
  %5 = load i8*, i8** %data.addr, align 8, !dbg !102
  %6 = load i64, i64* %i, align 8, !dbg !103
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !102
  store i8 %4, i8* %arrayidx1, align 1, !dbg !104
  br label %for.inc, !dbg !105

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !106
  %inc = add i64 %7, 1, !dbg !106
  store i64 %inc, i64* %i, align 8, !dbg !106
  br label %for.cond, !dbg !107, !llvm.loop !108

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data.addr, align 8, !dbg !110
  call void @printLine(i8* %8), !dbg !111
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_41_good() #0 !dbg !113 {
entry:
  call void @goodG2B(), !dbg !114
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !116 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !121, metadata !DIExpression()), !dbg !122
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !123, metadata !DIExpression()), !dbg !124
  %call = call i64 @time(i64* null) #7, !dbg !125
  %conv = trunc i64 %call to i32, !dbg !126
  call void @srand(i32 %conv) #7, !dbg !127
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !128
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_41_good(), !dbg !129
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !130
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !131
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_41_bad(), !dbg !132
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !133
  ret i32 0, !dbg !134
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !135 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !138, metadata !DIExpression()), !dbg !139
  %0 = alloca i8, i64 10, align 16, !dbg !140
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !139
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !141, metadata !DIExpression()), !dbg !142
  %1 = alloca i8, i64 11, align 16, !dbg !143
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !142
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !144
  store i8* %2, i8** %data, align 8, !dbg !145
  %3 = load i8*, i8** %data, align 8, !dbg !146
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !146
  store i8 0, i8* %arrayidx, align 1, !dbg !147
  %4 = load i8*, i8** %data, align 8, !dbg !148
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_41_goodG2BSink(i8* %4), !dbg !149
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_41.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_41_badSink", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_41.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !4}
!17 = !DILocalVariable(name: "data", arg: 1, scope: !13, file: !14, line: 28, type: !4)
!18 = !DILocation(line: 28, column: 84, scope: !13)
!19 = !DILocalVariable(name: "source", scope: !20, file: !14, line: 31, type: !21)
!20 = distinct !DILexicalBlock(scope: !13, file: !14, line: 30, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 11)
!24 = !DILocation(line: 31, column: 14, scope: !20)
!25 = !DILocalVariable(name: "i", scope: !20, file: !14, line: 32, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !27, line: 46, baseType: !28)
!27 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!28 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!29 = !DILocation(line: 32, column: 16, scope: !20)
!30 = !DILocalVariable(name: "sourceLen", scope: !20, file: !14, line: 32, type: !26)
!31 = !DILocation(line: 32, column: 19, scope: !20)
!32 = !DILocation(line: 33, column: 28, scope: !20)
!33 = !DILocation(line: 33, column: 21, scope: !20)
!34 = !DILocation(line: 33, column: 19, scope: !20)
!35 = !DILocation(line: 36, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !20, file: !14, line: 36, column: 9)
!37 = !DILocation(line: 36, column: 14, scope: !36)
!38 = !DILocation(line: 36, column: 21, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !14, line: 36, column: 9)
!40 = !DILocation(line: 36, column: 25, scope: !39)
!41 = !DILocation(line: 36, column: 35, scope: !39)
!42 = !DILocation(line: 36, column: 23, scope: !39)
!43 = !DILocation(line: 36, column: 9, scope: !36)
!44 = !DILocation(line: 38, column: 30, scope: !45)
!45 = distinct !DILexicalBlock(scope: !39, file: !14, line: 37, column: 9)
!46 = !DILocation(line: 38, column: 23, scope: !45)
!47 = !DILocation(line: 38, column: 13, scope: !45)
!48 = !DILocation(line: 38, column: 18, scope: !45)
!49 = !DILocation(line: 38, column: 21, scope: !45)
!50 = !DILocation(line: 39, column: 9, scope: !45)
!51 = !DILocation(line: 36, column: 41, scope: !39)
!52 = !DILocation(line: 36, column: 9, scope: !39)
!53 = distinct !{!53, !43, !54, !55}
!54 = !DILocation(line: 39, column: 9, scope: !36)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 40, column: 19, scope: !20)
!57 = !DILocation(line: 40, column: 9, scope: !20)
!58 = !DILocation(line: 42, column: 1, scope: !13)
!59 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_41_bad", scope: !14, file: !14, line: 44, type: !60, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{null}
!62 = !DILocalVariable(name: "data", scope: !59, file: !14, line: 46, type: !4)
!63 = !DILocation(line: 46, column: 12, scope: !59)
!64 = !DILocalVariable(name: "dataBadBuffer", scope: !59, file: !14, line: 47, type: !4)
!65 = !DILocation(line: 47, column: 12, scope: !59)
!66 = !DILocation(line: 47, column: 36, scope: !59)
!67 = !DILocalVariable(name: "dataGoodBuffer", scope: !59, file: !14, line: 48, type: !4)
!68 = !DILocation(line: 48, column: 12, scope: !59)
!69 = !DILocation(line: 48, column: 37, scope: !59)
!70 = !DILocation(line: 51, column: 12, scope: !59)
!71 = !DILocation(line: 51, column: 10, scope: !59)
!72 = !DILocation(line: 52, column: 5, scope: !59)
!73 = !DILocation(line: 52, column: 13, scope: !59)
!74 = !DILocation(line: 53, column: 76, scope: !59)
!75 = !DILocation(line: 53, column: 5, scope: !59)
!76 = !DILocation(line: 54, column: 1, scope: !59)
!77 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_41_goodG2BSink", scope: !14, file: !14, line: 60, type: !15, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", arg: 1, scope: !77, file: !14, line: 60, type: !4)
!79 = !DILocation(line: 60, column: 88, scope: !77)
!80 = !DILocalVariable(name: "source", scope: !81, file: !14, line: 63, type: !21)
!81 = distinct !DILexicalBlock(scope: !77, file: !14, line: 62, column: 5)
!82 = !DILocation(line: 63, column: 14, scope: !81)
!83 = !DILocalVariable(name: "i", scope: !81, file: !14, line: 64, type: !26)
!84 = !DILocation(line: 64, column: 16, scope: !81)
!85 = !DILocalVariable(name: "sourceLen", scope: !81, file: !14, line: 64, type: !26)
!86 = !DILocation(line: 64, column: 19, scope: !81)
!87 = !DILocation(line: 65, column: 28, scope: !81)
!88 = !DILocation(line: 65, column: 21, scope: !81)
!89 = !DILocation(line: 65, column: 19, scope: !81)
!90 = !DILocation(line: 68, column: 16, scope: !91)
!91 = distinct !DILexicalBlock(scope: !81, file: !14, line: 68, column: 9)
!92 = !DILocation(line: 68, column: 14, scope: !91)
!93 = !DILocation(line: 68, column: 21, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !14, line: 68, column: 9)
!95 = !DILocation(line: 68, column: 25, scope: !94)
!96 = !DILocation(line: 68, column: 35, scope: !94)
!97 = !DILocation(line: 68, column: 23, scope: !94)
!98 = !DILocation(line: 68, column: 9, scope: !91)
!99 = !DILocation(line: 70, column: 30, scope: !100)
!100 = distinct !DILexicalBlock(scope: !94, file: !14, line: 69, column: 9)
!101 = !DILocation(line: 70, column: 23, scope: !100)
!102 = !DILocation(line: 70, column: 13, scope: !100)
!103 = !DILocation(line: 70, column: 18, scope: !100)
!104 = !DILocation(line: 70, column: 21, scope: !100)
!105 = !DILocation(line: 71, column: 9, scope: !100)
!106 = !DILocation(line: 68, column: 41, scope: !94)
!107 = !DILocation(line: 68, column: 9, scope: !94)
!108 = distinct !{!108, !98, !109, !55}
!109 = !DILocation(line: 71, column: 9, scope: !91)
!110 = !DILocation(line: 72, column: 19, scope: !81)
!111 = !DILocation(line: 72, column: 9, scope: !81)
!112 = !DILocation(line: 74, column: 1, scope: !77)
!113 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_41_good", scope: !14, file: !14, line: 89, type: !60, scopeLine: 90, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocation(line: 91, column: 5, scope: !113)
!115 = !DILocation(line: 92, column: 1, scope: !113)
!116 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 104, type: !117, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!117 = !DISubroutineType(types: !118)
!118 = !{!119, !119, !120}
!119 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!120 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!121 = !DILocalVariable(name: "argc", arg: 1, scope: !116, file: !14, line: 104, type: !119)
!122 = !DILocation(line: 104, column: 14, scope: !116)
!123 = !DILocalVariable(name: "argv", arg: 2, scope: !116, file: !14, line: 104, type: !120)
!124 = !DILocation(line: 104, column: 27, scope: !116)
!125 = !DILocation(line: 107, column: 22, scope: !116)
!126 = !DILocation(line: 107, column: 12, scope: !116)
!127 = !DILocation(line: 107, column: 5, scope: !116)
!128 = !DILocation(line: 109, column: 5, scope: !116)
!129 = !DILocation(line: 110, column: 5, scope: !116)
!130 = !DILocation(line: 111, column: 5, scope: !116)
!131 = !DILocation(line: 114, column: 5, scope: !116)
!132 = !DILocation(line: 115, column: 5, scope: !116)
!133 = !DILocation(line: 116, column: 5, scope: !116)
!134 = !DILocation(line: 118, column: 5, scope: !116)
!135 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 77, type: !60, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!136 = !DILocalVariable(name: "data", scope: !135, file: !14, line: 79, type: !4)
!137 = !DILocation(line: 79, column: 12, scope: !135)
!138 = !DILocalVariable(name: "dataBadBuffer", scope: !135, file: !14, line: 80, type: !4)
!139 = !DILocation(line: 80, column: 12, scope: !135)
!140 = !DILocation(line: 80, column: 36, scope: !135)
!141 = !DILocalVariable(name: "dataGoodBuffer", scope: !135, file: !14, line: 81, type: !4)
!142 = !DILocation(line: 81, column: 12, scope: !135)
!143 = !DILocation(line: 81, column: 37, scope: !135)
!144 = !DILocation(line: 84, column: 12, scope: !135)
!145 = !DILocation(line: 84, column: 10, scope: !135)
!146 = !DILocation(line: 85, column: 5, scope: !135)
!147 = !DILocation(line: 85, column: 13, scope: !135)
!148 = !DILocation(line: 86, column: 80, scope: !135)
!149 = !DILocation(line: 86, column: 5, scope: !135)
!150 = !DILocation(line: 87, column: 1, scope: !135)
