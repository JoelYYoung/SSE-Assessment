; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_45_goodG2BData = internal global i32* null, align 8, !dbg !12
@__const.goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_45_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 40, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = alloca i8, i64 44, align 16, !dbg !32
  %3 = bitcast i8* %2 to i32*, !dbg !33
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !31
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !34
  store i32* %4, i32** %data, align 8, !dbg !35
  %5 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %6 = load i32*, i32** %data, align 8, !dbg !38
  store i32* %6, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_45_badData, align 8, !dbg !39
  call void @badSink(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_45_good() #0 !dbg !42 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %call = call i64 @time(i64* null) #6, !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 %conv) #6, !dbg !57
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !58
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_45_good(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_45_bad(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !65 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !66, metadata !DIExpression()), !dbg !67
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_45_badData, align 8, !dbg !68
  store i32* %0, i32** %data, align 8, !dbg !67
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !69, metadata !DIExpression()), !dbg !74
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !74
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.badSink.source to i8*), i64 44, i1 false), !dbg !74
  call void @llvm.dbg.declare(metadata i64* %i, metadata !75, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !79, metadata !DIExpression()), !dbg !80
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !81
  %call = call i64 @wcslen(i32* %arraydecay) #7, !dbg !82
  store i64 %call, i64* %sourceLen, align 8, !dbg !83
  store i64 0, i64* %i, align 8, !dbg !84
  br label %for.cond, !dbg !86

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !87
  %3 = load i64, i64* %sourceLen, align 8, !dbg !89
  %add = add i64 %3, 1, !dbg !90
  %cmp = icmp ult i64 %2, %add, !dbg !91
  br i1 %cmp, label %for.body, label %for.end, !dbg !92

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !93
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !95
  %5 = load i32, i32* %arrayidx, align 4, !dbg !95
  %6 = load i32*, i32** %data, align 8, !dbg !96
  %7 = load i64, i64* %i, align 8, !dbg !97
  %arrayidx1 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !96
  store i32 %5, i32* %arrayidx1, align 4, !dbg !98
  br label %for.inc, !dbg !99

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !100
  %inc = add i64 %8, 1, !dbg !100
  store i64 %inc, i64* %i, align 8, !dbg !100
  br label %for.cond, !dbg !101, !llvm.loop !102

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !105
  call void @printWLine(i32* %9), !dbg !106
  ret void, !dbg !107
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !108 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %0 = alloca i8, i64 40, align 16, !dbg !113
  %1 = bitcast i8* %0 to i32*, !dbg !114
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  %2 = alloca i8, i64 44, align 16, !dbg !117
  %3 = bitcast i8* %2 to i32*, !dbg !118
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !116
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !119
  store i32* %4, i32** %data, align 8, !dbg !120
  %5 = load i32*, i32** %data, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !121
  store i32 0, i32* %arrayidx, align 4, !dbg !122
  %6 = load i32*, i32** %data, align 8, !dbg !123
  store i32* %6, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_45_goodG2BData, align 8, !dbg !124
  call void @goodG2BSink(), !dbg !125
  ret void, !dbg !126
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !127 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !128, metadata !DIExpression()), !dbg !129
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_45_goodG2BData, align 8, !dbg !130
  store i32* %0, i32** %data, align 8, !dbg !129
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !131, metadata !DIExpression()), !dbg !133
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !133
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2BSink.source to i8*), i64 44, i1 false), !dbg !133
  call void @llvm.dbg.declare(metadata i64* %i, metadata !134, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !136, metadata !DIExpression()), !dbg !137
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !138
  %call = call i64 @wcslen(i32* %arraydecay) #7, !dbg !139
  store i64 %call, i64* %sourceLen, align 8, !dbg !140
  store i64 0, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !143

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !144
  %3 = load i64, i64* %sourceLen, align 8, !dbg !146
  %add = add i64 %3, 1, !dbg !147
  %cmp = icmp ult i64 %2, %add, !dbg !148
  br i1 %cmp, label %for.body, label %for.end, !dbg !149

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !152
  %5 = load i32, i32* %arrayidx, align 4, !dbg !152
  %6 = load i32*, i32** %data, align 8, !dbg !153
  %7 = load i64, i64* %i, align 8, !dbg !154
  %arrayidx1 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !153
  store i32 %5, i32* %arrayidx1, align 4, !dbg !155
  br label %for.inc, !dbg !156

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !157
  %inc = add i64 %8, 1, !dbg !157
  store i64 %inc, i64* %i, align 8, !dbg !157
  br label %for.cond, !dbg !158, !llvm.loop !159

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !161
  call void @printWLine(i32* %9), !dbg !162
  ret void, !dbg !163
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
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_45_badData", scope: !2, file: !14, line: 26, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_45.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_45_goodG2BData", scope: !2, file: !14, line: 27, type: !6, isLocal: true, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_45.c", directory: "/root/SSE-Assessment")
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_45_bad", scope: !14, file: !14, line: 48, type: !22, scopeLine: 49, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !14, line: 50, type: !6)
!25 = !DILocation(line: 50, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !21, file: !14, line: 51, type: !6)
!27 = !DILocation(line: 51, column: 15, scope: !21)
!28 = !DILocation(line: 51, column: 42, scope: !21)
!29 = !DILocation(line: 51, column: 31, scope: !21)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !21, file: !14, line: 52, type: !6)
!31 = !DILocation(line: 52, column: 15, scope: !21)
!32 = !DILocation(line: 52, column: 43, scope: !21)
!33 = !DILocation(line: 52, column: 32, scope: !21)
!34 = !DILocation(line: 55, column: 12, scope: !21)
!35 = !DILocation(line: 55, column: 10, scope: !21)
!36 = !DILocation(line: 56, column: 5, scope: !21)
!37 = !DILocation(line: 56, column: 13, scope: !21)
!38 = !DILocation(line: 57, column: 81, scope: !21)
!39 = !DILocation(line: 57, column: 79, scope: !21)
!40 = !DILocation(line: 58, column: 5, scope: !21)
!41 = !DILocation(line: 59, column: 1, scope: !21)
!42 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_45_good", scope: !14, file: !14, line: 96, type: !22, scopeLine: 97, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!43 = !DILocation(line: 98, column: 5, scope: !42)
!44 = !DILocation(line: 99, column: 1, scope: !42)
!45 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 110, type: !46, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!46 = !DISubroutineType(types: !47)
!47 = !{!9, !9, !48}
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !14, line: 110, type: !9)
!52 = !DILocation(line: 110, column: 14, scope: !45)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !14, line: 110, type: !48)
!54 = !DILocation(line: 110, column: 27, scope: !45)
!55 = !DILocation(line: 113, column: 22, scope: !45)
!56 = !DILocation(line: 113, column: 12, scope: !45)
!57 = !DILocation(line: 113, column: 5, scope: !45)
!58 = !DILocation(line: 115, column: 5, scope: !45)
!59 = !DILocation(line: 116, column: 5, scope: !45)
!60 = !DILocation(line: 117, column: 5, scope: !45)
!61 = !DILocation(line: 120, column: 5, scope: !45)
!62 = !DILocation(line: 121, column: 5, scope: !45)
!63 = !DILocation(line: 122, column: 5, scope: !45)
!64 = !DILocation(line: 124, column: 5, scope: !45)
!65 = distinct !DISubprogram(name: "badSink", scope: !14, file: !14, line: 31, type: !22, scopeLine: 32, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!66 = !DILocalVariable(name: "data", scope: !65, file: !14, line: 33, type: !6)
!67 = !DILocation(line: 33, column: 15, scope: !65)
!68 = !DILocation(line: 33, column: 22, scope: !65)
!69 = !DILocalVariable(name: "source", scope: !70, file: !14, line: 35, type: !71)
!70 = distinct !DILexicalBlock(scope: !65, file: !14, line: 34, column: 5)
!71 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 352, elements: !72)
!72 = !{!73}
!73 = !DISubrange(count: 11)
!74 = !DILocation(line: 35, column: 17, scope: !70)
!75 = !DILocalVariable(name: "i", scope: !70, file: !14, line: 36, type: !76)
!76 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !8, line: 46, baseType: !77)
!77 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!78 = !DILocation(line: 36, column: 16, scope: !70)
!79 = !DILocalVariable(name: "sourceLen", scope: !70, file: !14, line: 36, type: !76)
!80 = !DILocation(line: 36, column: 19, scope: !70)
!81 = !DILocation(line: 37, column: 28, scope: !70)
!82 = !DILocation(line: 37, column: 21, scope: !70)
!83 = !DILocation(line: 37, column: 19, scope: !70)
!84 = !DILocation(line: 40, column: 16, scope: !85)
!85 = distinct !DILexicalBlock(scope: !70, file: !14, line: 40, column: 9)
!86 = !DILocation(line: 40, column: 14, scope: !85)
!87 = !DILocation(line: 40, column: 21, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !14, line: 40, column: 9)
!89 = !DILocation(line: 40, column: 25, scope: !88)
!90 = !DILocation(line: 40, column: 35, scope: !88)
!91 = !DILocation(line: 40, column: 23, scope: !88)
!92 = !DILocation(line: 40, column: 9, scope: !85)
!93 = !DILocation(line: 42, column: 30, scope: !94)
!94 = distinct !DILexicalBlock(scope: !88, file: !14, line: 41, column: 9)
!95 = !DILocation(line: 42, column: 23, scope: !94)
!96 = !DILocation(line: 42, column: 13, scope: !94)
!97 = !DILocation(line: 42, column: 18, scope: !94)
!98 = !DILocation(line: 42, column: 21, scope: !94)
!99 = !DILocation(line: 43, column: 9, scope: !94)
!100 = !DILocation(line: 40, column: 41, scope: !88)
!101 = !DILocation(line: 40, column: 9, scope: !88)
!102 = distinct !{!102, !92, !103, !104}
!103 = !DILocation(line: 43, column: 9, scope: !85)
!104 = !{!"llvm.loop.mustprogress"}
!105 = !DILocation(line: 44, column: 20, scope: !70)
!106 = !DILocation(line: 44, column: 9, scope: !70)
!107 = !DILocation(line: 46, column: 1, scope: !65)
!108 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 83, type: !22, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!109 = !DILocalVariable(name: "data", scope: !108, file: !14, line: 85, type: !6)
!110 = !DILocation(line: 85, column: 15, scope: !108)
!111 = !DILocalVariable(name: "dataBadBuffer", scope: !108, file: !14, line: 86, type: !6)
!112 = !DILocation(line: 86, column: 15, scope: !108)
!113 = !DILocation(line: 86, column: 42, scope: !108)
!114 = !DILocation(line: 86, column: 31, scope: !108)
!115 = !DILocalVariable(name: "dataGoodBuffer", scope: !108, file: !14, line: 87, type: !6)
!116 = !DILocation(line: 87, column: 15, scope: !108)
!117 = !DILocation(line: 87, column: 43, scope: !108)
!118 = !DILocation(line: 87, column: 32, scope: !108)
!119 = !DILocation(line: 90, column: 12, scope: !108)
!120 = !DILocation(line: 90, column: 10, scope: !108)
!121 = !DILocation(line: 91, column: 5, scope: !108)
!122 = !DILocation(line: 91, column: 13, scope: !108)
!123 = !DILocation(line: 92, column: 85, scope: !108)
!124 = !DILocation(line: 92, column: 83, scope: !108)
!125 = !DILocation(line: 93, column: 5, scope: !108)
!126 = !DILocation(line: 94, column: 1, scope: !108)
!127 = distinct !DISubprogram(name: "goodG2BSink", scope: !14, file: !14, line: 66, type: !22, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!128 = !DILocalVariable(name: "data", scope: !127, file: !14, line: 68, type: !6)
!129 = !DILocation(line: 68, column: 15, scope: !127)
!130 = !DILocation(line: 68, column: 22, scope: !127)
!131 = !DILocalVariable(name: "source", scope: !132, file: !14, line: 70, type: !71)
!132 = distinct !DILexicalBlock(scope: !127, file: !14, line: 69, column: 5)
!133 = !DILocation(line: 70, column: 17, scope: !132)
!134 = !DILocalVariable(name: "i", scope: !132, file: !14, line: 71, type: !76)
!135 = !DILocation(line: 71, column: 16, scope: !132)
!136 = !DILocalVariable(name: "sourceLen", scope: !132, file: !14, line: 71, type: !76)
!137 = !DILocation(line: 71, column: 19, scope: !132)
!138 = !DILocation(line: 72, column: 28, scope: !132)
!139 = !DILocation(line: 72, column: 21, scope: !132)
!140 = !DILocation(line: 72, column: 19, scope: !132)
!141 = !DILocation(line: 75, column: 16, scope: !142)
!142 = distinct !DILexicalBlock(scope: !132, file: !14, line: 75, column: 9)
!143 = !DILocation(line: 75, column: 14, scope: !142)
!144 = !DILocation(line: 75, column: 21, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !14, line: 75, column: 9)
!146 = !DILocation(line: 75, column: 25, scope: !145)
!147 = !DILocation(line: 75, column: 35, scope: !145)
!148 = !DILocation(line: 75, column: 23, scope: !145)
!149 = !DILocation(line: 75, column: 9, scope: !142)
!150 = !DILocation(line: 77, column: 30, scope: !151)
!151 = distinct !DILexicalBlock(scope: !145, file: !14, line: 76, column: 9)
!152 = !DILocation(line: 77, column: 23, scope: !151)
!153 = !DILocation(line: 77, column: 13, scope: !151)
!154 = !DILocation(line: 77, column: 18, scope: !151)
!155 = !DILocation(line: 77, column: 21, scope: !151)
!156 = !DILocation(line: 78, column: 9, scope: !151)
!157 = !DILocation(line: 75, column: 41, scope: !145)
!158 = !DILocation(line: 75, column: 9, scope: !145)
!159 = distinct !{!159, !149, !160, !104}
!160 = !DILocation(line: 78, column: 9, scope: !142)
!161 = !DILocation(line: 79, column: 20, scope: !132)
!162 = !DILocation(line: 79, column: 9, scope: !132)
!163 = !DILocation(line: 81, column: 1, scope: !127)
