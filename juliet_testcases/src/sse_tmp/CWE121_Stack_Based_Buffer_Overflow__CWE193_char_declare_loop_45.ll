; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_45_goodG2BData = internal global i8* null, align 8, !dbg !8
@__const.goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i8* %arraydecay, i8** %data, align 8, !dbg !35
  %0 = load i8*, i8** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  %1 = load i8*, i8** %data, align 8, !dbg !38
  store i8* %1, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_45_badData, align 8, !dbg !39
  call void @badSink(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_45_good() #0 !dbg !42 {
entry:
  call void @goodG2B(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !52, metadata !DIExpression()), !dbg !53
  %call = call i64 @time(i64* null) #6, !dbg !54
  %conv = trunc i64 %call to i32, !dbg !55
  call void @srand(i32 %conv) #6, !dbg !56
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_45_good(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_45_bad(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !62
  ret i32 0, !dbg !63
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !64 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !65, metadata !DIExpression()), !dbg !66
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_45_badData, align 8, !dbg !67
  store i8* %0, i8** %data, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !68, metadata !DIExpression()), !dbg !70
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !70
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !70
  call void @llvm.dbg.declare(metadata i64* %i, metadata !71, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !76, metadata !DIExpression()), !dbg !77
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !78
  %call = call i64 @strlen(i8* %arraydecay) #7, !dbg !79
  store i64 %call, i64* %sourceLen, align 8, !dbg !80
  store i64 0, i64* %i, align 8, !dbg !81
  br label %for.cond, !dbg !83

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !84
  %3 = load i64, i64* %sourceLen, align 8, !dbg !86
  %add = add i64 %3, 1, !dbg !87
  %cmp = icmp ult i64 %2, %add, !dbg !88
  br i1 %cmp, label %for.body, label %for.end, !dbg !89

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !90
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !92
  %5 = load i8, i8* %arrayidx, align 1, !dbg !92
  %6 = load i8*, i8** %data, align 8, !dbg !93
  %7 = load i64, i64* %i, align 8, !dbg !94
  %arrayidx1 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !93
  store i8 %5, i8* %arrayidx1, align 1, !dbg !95
  br label %for.inc, !dbg !96

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !97
  %inc = add i64 %8, 1, !dbg !97
  store i64 %inc, i64* %i, align 8, !dbg !97
  br label %for.cond, !dbg !98, !llvm.loop !99

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !102
  call void @printLine(i8* %9), !dbg !103
  ret void, !dbg !104
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !105 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !112
  store i8* %arraydecay, i8** %data, align 8, !dbg !113
  %0 = load i8*, i8** %data, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !114
  store i8 0, i8* %arrayidx, align 1, !dbg !115
  %1 = load i8*, i8** %data, align 8, !dbg !116
  store i8* %1, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_45_goodG2BData, align 8, !dbg !117
  call void @goodG2BSink(), !dbg !118
  ret void, !dbg !119
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !120 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !121, metadata !DIExpression()), !dbg !122
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_45_goodG2BData, align 8, !dbg !123
  store i8* %0, i8** %data, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !124, metadata !DIExpression()), !dbg !126
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !126
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !126
  call void @llvm.dbg.declare(metadata i64* %i, metadata !127, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !129, metadata !DIExpression()), !dbg !130
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !131
  %call = call i64 @strlen(i8* %arraydecay) #7, !dbg !132
  store i64 %call, i64* %sourceLen, align 8, !dbg !133
  store i64 0, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !136

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !137
  %3 = load i64, i64* %sourceLen, align 8, !dbg !139
  %add = add i64 %3, 1, !dbg !140
  %cmp = icmp ult i64 %2, %add, !dbg !141
  br i1 %cmp, label %for.body, label %for.end, !dbg !142

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !145
  %5 = load i8, i8* %arrayidx, align 1, !dbg !145
  %6 = load i8*, i8** %data, align 8, !dbg !146
  %7 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx1 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !146
  store i8 %5, i8* %arrayidx1, align 1, !dbg !148
  br label %for.inc, !dbg !149

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !150
  %inc = add i64 %8, 1, !dbg !150
  store i64 %inc, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !154
  call void @printLine(i8* %9), !dbg !155
  ret void, !dbg !156
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_45_badData", scope: !2, file: !10, line: 26, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_45.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_45_goodG2BData", scope: !2, file: !10, line: 27, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_45.c", directory: "/root/SSE-Assessment")
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_45_bad", scope: !10, file: !10, line: 48, type: !20, scopeLine: 49, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !10, line: 50, type: !11)
!23 = !DILocation(line: 50, column: 12, scope: !19)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !10, line: 51, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 80, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 10)
!28 = !DILocation(line: 51, column: 10, scope: !19)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !10, line: 52, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 88, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 11)
!33 = !DILocation(line: 52, column: 10, scope: !19)
!34 = !DILocation(line: 55, column: 12, scope: !19)
!35 = !DILocation(line: 55, column: 10, scope: !19)
!36 = !DILocation(line: 56, column: 5, scope: !19)
!37 = !DILocation(line: 56, column: 13, scope: !19)
!38 = !DILocation(line: 57, column: 79, scope: !19)
!39 = !DILocation(line: 57, column: 77, scope: !19)
!40 = !DILocation(line: 58, column: 5, scope: !19)
!41 = !DILocation(line: 59, column: 1, scope: !19)
!42 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_45_good", scope: !10, file: !10, line: 96, type: !20, scopeLine: 97, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!43 = !DILocation(line: 98, column: 5, scope: !42)
!44 = !DILocation(line: 99, column: 1, scope: !42)
!45 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 110, type: !46, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!46 = !DISubroutineType(types: !47)
!47 = !{!48, !48, !49}
!48 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !10, line: 110, type: !48)
!51 = !DILocation(line: 110, column: 14, scope: !45)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !10, line: 110, type: !49)
!53 = !DILocation(line: 110, column: 27, scope: !45)
!54 = !DILocation(line: 113, column: 22, scope: !45)
!55 = !DILocation(line: 113, column: 12, scope: !45)
!56 = !DILocation(line: 113, column: 5, scope: !45)
!57 = !DILocation(line: 115, column: 5, scope: !45)
!58 = !DILocation(line: 116, column: 5, scope: !45)
!59 = !DILocation(line: 117, column: 5, scope: !45)
!60 = !DILocation(line: 120, column: 5, scope: !45)
!61 = !DILocation(line: 121, column: 5, scope: !45)
!62 = !DILocation(line: 122, column: 5, scope: !45)
!63 = !DILocation(line: 124, column: 5, scope: !45)
!64 = distinct !DISubprogram(name: "badSink", scope: !10, file: !10, line: 31, type: !20, scopeLine: 32, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!65 = !DILocalVariable(name: "data", scope: !64, file: !10, line: 33, type: !11)
!66 = !DILocation(line: 33, column: 12, scope: !64)
!67 = !DILocation(line: 33, column: 19, scope: !64)
!68 = !DILocalVariable(name: "source", scope: !69, file: !10, line: 35, type: !30)
!69 = distinct !DILexicalBlock(scope: !64, file: !10, line: 34, column: 5)
!70 = !DILocation(line: 35, column: 14, scope: !69)
!71 = !DILocalVariable(name: "i", scope: !69, file: !10, line: 36, type: !72)
!72 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !73, line: 46, baseType: !74)
!73 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!74 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!75 = !DILocation(line: 36, column: 16, scope: !69)
!76 = !DILocalVariable(name: "sourceLen", scope: !69, file: !10, line: 36, type: !72)
!77 = !DILocation(line: 36, column: 19, scope: !69)
!78 = !DILocation(line: 37, column: 28, scope: !69)
!79 = !DILocation(line: 37, column: 21, scope: !69)
!80 = !DILocation(line: 37, column: 19, scope: !69)
!81 = !DILocation(line: 40, column: 16, scope: !82)
!82 = distinct !DILexicalBlock(scope: !69, file: !10, line: 40, column: 9)
!83 = !DILocation(line: 40, column: 14, scope: !82)
!84 = !DILocation(line: 40, column: 21, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !10, line: 40, column: 9)
!86 = !DILocation(line: 40, column: 25, scope: !85)
!87 = !DILocation(line: 40, column: 35, scope: !85)
!88 = !DILocation(line: 40, column: 23, scope: !85)
!89 = !DILocation(line: 40, column: 9, scope: !82)
!90 = !DILocation(line: 42, column: 30, scope: !91)
!91 = distinct !DILexicalBlock(scope: !85, file: !10, line: 41, column: 9)
!92 = !DILocation(line: 42, column: 23, scope: !91)
!93 = !DILocation(line: 42, column: 13, scope: !91)
!94 = !DILocation(line: 42, column: 18, scope: !91)
!95 = !DILocation(line: 42, column: 21, scope: !91)
!96 = !DILocation(line: 43, column: 9, scope: !91)
!97 = !DILocation(line: 40, column: 41, scope: !85)
!98 = !DILocation(line: 40, column: 9, scope: !85)
!99 = distinct !{!99, !89, !100, !101}
!100 = !DILocation(line: 43, column: 9, scope: !82)
!101 = !{!"llvm.loop.mustprogress"}
!102 = !DILocation(line: 44, column: 19, scope: !69)
!103 = !DILocation(line: 44, column: 9, scope: !69)
!104 = !DILocation(line: 46, column: 1, scope: !64)
!105 = distinct !DISubprogram(name: "goodG2B", scope: !10, file: !10, line: 83, type: !20, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!106 = !DILocalVariable(name: "data", scope: !105, file: !10, line: 85, type: !11)
!107 = !DILocation(line: 85, column: 12, scope: !105)
!108 = !DILocalVariable(name: "dataBadBuffer", scope: !105, file: !10, line: 86, type: !25)
!109 = !DILocation(line: 86, column: 10, scope: !105)
!110 = !DILocalVariable(name: "dataGoodBuffer", scope: !105, file: !10, line: 87, type: !30)
!111 = !DILocation(line: 87, column: 10, scope: !105)
!112 = !DILocation(line: 90, column: 12, scope: !105)
!113 = !DILocation(line: 90, column: 10, scope: !105)
!114 = !DILocation(line: 91, column: 5, scope: !105)
!115 = !DILocation(line: 91, column: 13, scope: !105)
!116 = !DILocation(line: 92, column: 83, scope: !105)
!117 = !DILocation(line: 92, column: 81, scope: !105)
!118 = !DILocation(line: 93, column: 5, scope: !105)
!119 = !DILocation(line: 94, column: 1, scope: !105)
!120 = distinct !DISubprogram(name: "goodG2BSink", scope: !10, file: !10, line: 66, type: !20, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!121 = !DILocalVariable(name: "data", scope: !120, file: !10, line: 68, type: !11)
!122 = !DILocation(line: 68, column: 12, scope: !120)
!123 = !DILocation(line: 68, column: 19, scope: !120)
!124 = !DILocalVariable(name: "source", scope: !125, file: !10, line: 70, type: !30)
!125 = distinct !DILexicalBlock(scope: !120, file: !10, line: 69, column: 5)
!126 = !DILocation(line: 70, column: 14, scope: !125)
!127 = !DILocalVariable(name: "i", scope: !125, file: !10, line: 71, type: !72)
!128 = !DILocation(line: 71, column: 16, scope: !125)
!129 = !DILocalVariable(name: "sourceLen", scope: !125, file: !10, line: 71, type: !72)
!130 = !DILocation(line: 71, column: 19, scope: !125)
!131 = !DILocation(line: 72, column: 28, scope: !125)
!132 = !DILocation(line: 72, column: 21, scope: !125)
!133 = !DILocation(line: 72, column: 19, scope: !125)
!134 = !DILocation(line: 75, column: 16, scope: !135)
!135 = distinct !DILexicalBlock(scope: !125, file: !10, line: 75, column: 9)
!136 = !DILocation(line: 75, column: 14, scope: !135)
!137 = !DILocation(line: 75, column: 21, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !10, line: 75, column: 9)
!139 = !DILocation(line: 75, column: 25, scope: !138)
!140 = !DILocation(line: 75, column: 35, scope: !138)
!141 = !DILocation(line: 75, column: 23, scope: !138)
!142 = !DILocation(line: 75, column: 9, scope: !135)
!143 = !DILocation(line: 77, column: 30, scope: !144)
!144 = distinct !DILexicalBlock(scope: !138, file: !10, line: 76, column: 9)
!145 = !DILocation(line: 77, column: 23, scope: !144)
!146 = !DILocation(line: 77, column: 13, scope: !144)
!147 = !DILocation(line: 77, column: 18, scope: !144)
!148 = !DILocation(line: 77, column: 21, scope: !144)
!149 = !DILocation(line: 78, column: 9, scope: !144)
!150 = !DILocation(line: 75, column: 41, scope: !138)
!151 = !DILocation(line: 75, column: 9, scope: !138)
!152 = distinct !{!152, !142, !153, !101}
!153 = !DILocation(line: 78, column: 9, scope: !135)
!154 = !DILocation(line: 79, column: 19, scope: !125)
!155 = !DILocation(line: 79, column: 9, scope: !125)
!156 = !DILocation(line: 81, column: 1, scope: !120)
