; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_45_goodG2BData = internal global i8* null, align 8, !dbg !10
@__const.goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 10, align 16, !dbg !26
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %1 = alloca i8, i64 11, align 16, !dbg !29
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !28
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !30
  store i8* %2, i8** %data, align 8, !dbg !31
  %3 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  %4 = load i8*, i8** %data, align 8, !dbg !34
  store i8* %4, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_45_badData, align 8, !dbg !35
  call void @badSink(), !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_45_good() #0 !dbg !38 {
entry:
  call void @goodG2B(), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !41 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !46, metadata !DIExpression()), !dbg !47
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !48, metadata !DIExpression()), !dbg !49
  %call = call i64 @time(i64* null) #6, !dbg !50
  %conv = trunc i64 %call to i32, !dbg !51
  call void @srand(i32 %conv) #6, !dbg !52
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !53
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_45_good(), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !55
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !56
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_45_bad(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !58
  ret i32 0, !dbg !59
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !60 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !61, metadata !DIExpression()), !dbg !62
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_45_badData, align 8, !dbg !63
  store i8* %0, i8** %data, align 8, !dbg !62
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !64, metadata !DIExpression()), !dbg !69
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !69
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !69
  call void @llvm.dbg.declare(metadata i64* %i, metadata !70, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !75, metadata !DIExpression()), !dbg !76
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !77
  %call = call i64 @strlen(i8* %arraydecay) #7, !dbg !78
  store i64 %call, i64* %sourceLen, align 8, !dbg !79
  store i64 0, i64* %i, align 8, !dbg !80
  br label %for.cond, !dbg !82

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !83
  %3 = load i64, i64* %sourceLen, align 8, !dbg !85
  %add = add i64 %3, 1, !dbg !86
  %cmp = icmp ult i64 %2, %add, !dbg !87
  br i1 %cmp, label %for.body, label %for.end, !dbg !88

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !89
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !91
  %5 = load i8, i8* %arrayidx, align 1, !dbg !91
  %6 = load i8*, i8** %data, align 8, !dbg !92
  %7 = load i64, i64* %i, align 8, !dbg !93
  %arrayidx1 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !92
  store i8 %5, i8* %arrayidx1, align 1, !dbg !94
  br label %for.inc, !dbg !95

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !96
  %inc = add i64 %8, 1, !dbg !96
  store i64 %inc, i64* %i, align 8, !dbg !96
  br label %for.cond, !dbg !97, !llvm.loop !98

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !101
  call void @printLine(i8* %9), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !104 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = alloca i8, i64 10, align 16, !dbg !109
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %1 = alloca i8, i64 11, align 16, !dbg !112
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !111
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !113
  store i8* %2, i8** %data, align 8, !dbg !114
  %3 = load i8*, i8** %data, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !115
  store i8 0, i8* %arrayidx, align 1, !dbg !116
  %4 = load i8*, i8** %data, align 8, !dbg !117
  store i8* %4, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_45_goodG2BData, align 8, !dbg !118
  call void @goodG2BSink(), !dbg !119
  ret void, !dbg !120
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !121 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !122, metadata !DIExpression()), !dbg !123
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_45_goodG2BData, align 8, !dbg !124
  store i8* %0, i8** %data, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !125, metadata !DIExpression()), !dbg !127
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !127
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !127
  call void @llvm.dbg.declare(metadata i64* %i, metadata !128, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !130, metadata !DIExpression()), !dbg !131
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !132
  %call = call i64 @strlen(i8* %arraydecay) #7, !dbg !133
  store i64 %call, i64* %sourceLen, align 8, !dbg !134
  store i64 0, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !137

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !138
  %3 = load i64, i64* %sourceLen, align 8, !dbg !140
  %add = add i64 %3, 1, !dbg !141
  %cmp = icmp ult i64 %2, %add, !dbg !142
  br i1 %cmp, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !146
  %5 = load i8, i8* %arrayidx, align 1, !dbg !146
  %6 = load i8*, i8** %data, align 8, !dbg !147
  %7 = load i64, i64* %i, align 8, !dbg !148
  %arrayidx1 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !147
  store i8 %5, i8* %arrayidx1, align 1, !dbg !149
  br label %for.inc, !dbg !150

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !151
  %inc = add i64 %8, 1, !dbg !151
  store i64 %inc, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !152, !llvm.loop !153

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !155
  call void @printLine(i8* %9), !dbg !156
  ret void, !dbg !157
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
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_45_badData", scope: !2, file: !12, line: 26, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_45_goodG2BData", scope: !2, file: !12, line: 27, type: !6, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_45_bad", scope: !12, file: !12, line: 48, type: !20, scopeLine: 49, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 50, type: !6)
!23 = !DILocation(line: 50, column: 12, scope: !19)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !12, line: 51, type: !6)
!25 = !DILocation(line: 51, column: 12, scope: !19)
!26 = !DILocation(line: 51, column: 36, scope: !19)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !12, line: 52, type: !6)
!28 = !DILocation(line: 52, column: 12, scope: !19)
!29 = !DILocation(line: 52, column: 37, scope: !19)
!30 = !DILocation(line: 55, column: 12, scope: !19)
!31 = !DILocation(line: 55, column: 10, scope: !19)
!32 = !DILocation(line: 56, column: 5, scope: !19)
!33 = !DILocation(line: 56, column: 13, scope: !19)
!34 = !DILocation(line: 57, column: 78, scope: !19)
!35 = !DILocation(line: 57, column: 76, scope: !19)
!36 = !DILocation(line: 58, column: 5, scope: !19)
!37 = !DILocation(line: 59, column: 1, scope: !19)
!38 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_45_good", scope: !12, file: !12, line: 96, type: !20, scopeLine: 97, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!39 = !DILocation(line: 98, column: 5, scope: !38)
!40 = !DILocation(line: 99, column: 1, scope: !38)
!41 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 110, type: !42, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!42 = !DISubroutineType(types: !43)
!43 = !{!44, !44, !45}
!44 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!46 = !DILocalVariable(name: "argc", arg: 1, scope: !41, file: !12, line: 110, type: !44)
!47 = !DILocation(line: 110, column: 14, scope: !41)
!48 = !DILocalVariable(name: "argv", arg: 2, scope: !41, file: !12, line: 110, type: !45)
!49 = !DILocation(line: 110, column: 27, scope: !41)
!50 = !DILocation(line: 113, column: 22, scope: !41)
!51 = !DILocation(line: 113, column: 12, scope: !41)
!52 = !DILocation(line: 113, column: 5, scope: !41)
!53 = !DILocation(line: 115, column: 5, scope: !41)
!54 = !DILocation(line: 116, column: 5, scope: !41)
!55 = !DILocation(line: 117, column: 5, scope: !41)
!56 = !DILocation(line: 120, column: 5, scope: !41)
!57 = !DILocation(line: 121, column: 5, scope: !41)
!58 = !DILocation(line: 122, column: 5, scope: !41)
!59 = !DILocation(line: 124, column: 5, scope: !41)
!60 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 31, type: !20, scopeLine: 32, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DILocalVariable(name: "data", scope: !60, file: !12, line: 33, type: !6)
!62 = !DILocation(line: 33, column: 12, scope: !60)
!63 = !DILocation(line: 33, column: 19, scope: !60)
!64 = !DILocalVariable(name: "source", scope: !65, file: !12, line: 35, type: !66)
!65 = distinct !DILexicalBlock(scope: !60, file: !12, line: 34, column: 5)
!66 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 88, elements: !67)
!67 = !{!68}
!68 = !DISubrange(count: 11)
!69 = !DILocation(line: 35, column: 14, scope: !65)
!70 = !DILocalVariable(name: "i", scope: !65, file: !12, line: 36, type: !71)
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !72, line: 46, baseType: !73)
!72 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!73 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!74 = !DILocation(line: 36, column: 16, scope: !65)
!75 = !DILocalVariable(name: "sourceLen", scope: !65, file: !12, line: 36, type: !71)
!76 = !DILocation(line: 36, column: 19, scope: !65)
!77 = !DILocation(line: 37, column: 28, scope: !65)
!78 = !DILocation(line: 37, column: 21, scope: !65)
!79 = !DILocation(line: 37, column: 19, scope: !65)
!80 = !DILocation(line: 40, column: 16, scope: !81)
!81 = distinct !DILexicalBlock(scope: !65, file: !12, line: 40, column: 9)
!82 = !DILocation(line: 40, column: 14, scope: !81)
!83 = !DILocation(line: 40, column: 21, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !12, line: 40, column: 9)
!85 = !DILocation(line: 40, column: 25, scope: !84)
!86 = !DILocation(line: 40, column: 35, scope: !84)
!87 = !DILocation(line: 40, column: 23, scope: !84)
!88 = !DILocation(line: 40, column: 9, scope: !81)
!89 = !DILocation(line: 42, column: 30, scope: !90)
!90 = distinct !DILexicalBlock(scope: !84, file: !12, line: 41, column: 9)
!91 = !DILocation(line: 42, column: 23, scope: !90)
!92 = !DILocation(line: 42, column: 13, scope: !90)
!93 = !DILocation(line: 42, column: 18, scope: !90)
!94 = !DILocation(line: 42, column: 21, scope: !90)
!95 = !DILocation(line: 43, column: 9, scope: !90)
!96 = !DILocation(line: 40, column: 41, scope: !84)
!97 = !DILocation(line: 40, column: 9, scope: !84)
!98 = distinct !{!98, !88, !99, !100}
!99 = !DILocation(line: 43, column: 9, scope: !81)
!100 = !{!"llvm.loop.mustprogress"}
!101 = !DILocation(line: 44, column: 19, scope: !65)
!102 = !DILocation(line: 44, column: 9, scope: !65)
!103 = !DILocation(line: 46, column: 1, scope: !60)
!104 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 83, type: !20, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!105 = !DILocalVariable(name: "data", scope: !104, file: !12, line: 85, type: !6)
!106 = !DILocation(line: 85, column: 12, scope: !104)
!107 = !DILocalVariable(name: "dataBadBuffer", scope: !104, file: !12, line: 86, type: !6)
!108 = !DILocation(line: 86, column: 12, scope: !104)
!109 = !DILocation(line: 86, column: 36, scope: !104)
!110 = !DILocalVariable(name: "dataGoodBuffer", scope: !104, file: !12, line: 87, type: !6)
!111 = !DILocation(line: 87, column: 12, scope: !104)
!112 = !DILocation(line: 87, column: 37, scope: !104)
!113 = !DILocation(line: 90, column: 12, scope: !104)
!114 = !DILocation(line: 90, column: 10, scope: !104)
!115 = !DILocation(line: 91, column: 5, scope: !104)
!116 = !DILocation(line: 91, column: 13, scope: !104)
!117 = !DILocation(line: 92, column: 82, scope: !104)
!118 = !DILocation(line: 92, column: 80, scope: !104)
!119 = !DILocation(line: 93, column: 5, scope: !104)
!120 = !DILocation(line: 94, column: 1, scope: !104)
!121 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 66, type: !20, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!122 = !DILocalVariable(name: "data", scope: !121, file: !12, line: 68, type: !6)
!123 = !DILocation(line: 68, column: 12, scope: !121)
!124 = !DILocation(line: 68, column: 19, scope: !121)
!125 = !DILocalVariable(name: "source", scope: !126, file: !12, line: 70, type: !66)
!126 = distinct !DILexicalBlock(scope: !121, file: !12, line: 69, column: 5)
!127 = !DILocation(line: 70, column: 14, scope: !126)
!128 = !DILocalVariable(name: "i", scope: !126, file: !12, line: 71, type: !71)
!129 = !DILocation(line: 71, column: 16, scope: !126)
!130 = !DILocalVariable(name: "sourceLen", scope: !126, file: !12, line: 71, type: !71)
!131 = !DILocation(line: 71, column: 19, scope: !126)
!132 = !DILocation(line: 72, column: 28, scope: !126)
!133 = !DILocation(line: 72, column: 21, scope: !126)
!134 = !DILocation(line: 72, column: 19, scope: !126)
!135 = !DILocation(line: 75, column: 16, scope: !136)
!136 = distinct !DILexicalBlock(scope: !126, file: !12, line: 75, column: 9)
!137 = !DILocation(line: 75, column: 14, scope: !136)
!138 = !DILocation(line: 75, column: 21, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !12, line: 75, column: 9)
!140 = !DILocation(line: 75, column: 25, scope: !139)
!141 = !DILocation(line: 75, column: 35, scope: !139)
!142 = !DILocation(line: 75, column: 23, scope: !139)
!143 = !DILocation(line: 75, column: 9, scope: !136)
!144 = !DILocation(line: 77, column: 30, scope: !145)
!145 = distinct !DILexicalBlock(scope: !139, file: !12, line: 76, column: 9)
!146 = !DILocation(line: 77, column: 23, scope: !145)
!147 = !DILocation(line: 77, column: 13, scope: !145)
!148 = !DILocation(line: 77, column: 18, scope: !145)
!149 = !DILocation(line: 77, column: 21, scope: !145)
!150 = !DILocation(line: 78, column: 9, scope: !145)
!151 = !DILocation(line: 75, column: 41, scope: !139)
!152 = !DILocation(line: 75, column: 9, scope: !139)
!153 = distinct !{!153, !143, !154, !100}
!154 = !DILocation(line: 78, column: 9, scope: !136)
!155 = !DILocation(line: 79, column: 19, scope: !126)
!156 = !DILocation(line: 79, column: 9, scope: !126)
!157 = !DILocation(line: 81, column: 1, scope: !121)
