; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_41_badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_41_goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_41_badSink(i32* %data) #0 !dbg !15 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !21, metadata !DIExpression()), !dbg !26
  %0 = bitcast [11 x i32]* %source to i8*, !dbg !26
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_41_badSink.source to i8*), i64 44, i1 false), !dbg !26
  call void @llvm.dbg.declare(metadata i64* %i, metadata !27, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !31, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !33
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !34
  store i64 %call, i64* %sourceLen, align 8, !dbg !35
  store i64 0, i64* %i, align 8, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !39
  %2 = load i64, i64* %sourceLen, align 8, !dbg !41
  %add = add i64 %2, 1, !dbg !42
  %cmp = icmp ult i64 %1, %add, !dbg !43
  br i1 %cmp, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !45
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %3, !dbg !47
  %4 = load i32, i32* %arrayidx, align 4, !dbg !47
  %5 = load i32*, i32** %data.addr, align 8, !dbg !48
  %6 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !48
  store i32 %4, i32* %arrayidx1, align 4, !dbg !50
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !52
  %inc = add i64 %7, 1, !dbg !52
  store i64 %inc, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data.addr, align 8, !dbg !57
  call void @printWLine(i32* %8), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_41_bad() #0 !dbg !60 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !63, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !65, metadata !DIExpression()), !dbg !66
  %0 = alloca i8, i64 40, align 16, !dbg !67
  %1 = bitcast i8* %0 to i32*, !dbg !68
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !69, metadata !DIExpression()), !dbg !70
  %2 = alloca i8, i64 44, align 16, !dbg !71
  %3 = bitcast i8* %2 to i32*, !dbg !72
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !70
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !73
  store i32* %4, i32** %data, align 8, !dbg !74
  %5 = load i32*, i32** %data, align 8, !dbg !75
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !75
  store i32 0, i32* %arrayidx, align 4, !dbg !76
  %6 = load i32*, i32** %data, align 8, !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_41_badSink(i32* %6), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_41_goodG2BSink(i32* %data) #0 !dbg !80 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !83, metadata !DIExpression()), !dbg !85
  %0 = bitcast [11 x i32]* %source to i8*, !dbg !85
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_41_goodG2BSink.source to i8*), i64 44, i1 false), !dbg !85
  call void @llvm.dbg.declare(metadata i64* %i, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !88, metadata !DIExpression()), !dbg !89
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !90
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !91
  store i64 %call, i64* %sourceLen, align 8, !dbg !92
  store i64 0, i64* %i, align 8, !dbg !93
  br label %for.cond, !dbg !95

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !96
  %2 = load i64, i64* %sourceLen, align 8, !dbg !98
  %add = add i64 %2, 1, !dbg !99
  %cmp = icmp ult i64 %1, %add, !dbg !100
  br i1 %cmp, label %for.body, label %for.end, !dbg !101

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !102
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %3, !dbg !104
  %4 = load i32, i32* %arrayidx, align 4, !dbg !104
  %5 = load i32*, i32** %data.addr, align 8, !dbg !105
  %6 = load i64, i64* %i, align 8, !dbg !106
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !105
  store i32 %4, i32* %arrayidx1, align 4, !dbg !107
  br label %for.inc, !dbg !108

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !109
  %inc = add i64 %7, 1, !dbg !109
  store i64 %inc, i64* %i, align 8, !dbg !109
  br label %for.cond, !dbg !110, !llvm.loop !111

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data.addr, align 8, !dbg !113
  call void @printWLine(i32* %8), !dbg !114
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_41_good() #0 !dbg !116 {
entry:
  call void @goodG2B(), !dbg !117
  ret void, !dbg !118
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !119 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !125, metadata !DIExpression()), !dbg !126
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !127, metadata !DIExpression()), !dbg !128
  %call = call i64 @time(i64* null) #7, !dbg !129
  %conv = trunc i64 %call to i32, !dbg !130
  call void @srand(i32 %conv) #7, !dbg !131
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !132
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_41_good(), !dbg !133
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !134
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !135
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_41_bad(), !dbg !136
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !137
  ret i32 0, !dbg !138
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !139 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !142, metadata !DIExpression()), !dbg !143
  %0 = alloca i8, i64 40, align 16, !dbg !144
  %1 = bitcast i8* %0 to i32*, !dbg !145
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !143
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !146, metadata !DIExpression()), !dbg !147
  %2 = alloca i8, i64 44, align 16, !dbg !148
  %3 = bitcast i8* %2 to i32*, !dbg !149
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !147
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !150
  store i32* %4, i32** %data, align 8, !dbg !151
  %5 = load i32*, i32** %data, align 8, !dbg !152
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !152
  store i32 0, i32* %arrayidx, align 4, !dbg !153
  %6 = load i32*, i32** %data, align 8, !dbg !154
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_41_goodG2BSink(i32* %6), !dbg !155
  ret void, !dbg !156
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
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_41.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_41_badSink", scope: !16, file: !16, line: 28, type: !17, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_41.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null, !4}
!19 = !DILocalVariable(name: "data", arg: 1, scope: !15, file: !16, line: 28, type: !4)
!20 = !DILocation(line: 28, column: 90, scope: !15)
!21 = !DILocalVariable(name: "source", scope: !22, file: !16, line: 31, type: !23)
!22 = distinct !DILexicalBlock(scope: !15, file: !16, line: 30, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 11)
!26 = !DILocation(line: 31, column: 17, scope: !22)
!27 = !DILocalVariable(name: "i", scope: !22, file: !16, line: 32, type: !28)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !29)
!29 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!30 = !DILocation(line: 32, column: 16, scope: !22)
!31 = !DILocalVariable(name: "sourceLen", scope: !22, file: !16, line: 32, type: !28)
!32 = !DILocation(line: 32, column: 19, scope: !22)
!33 = !DILocation(line: 33, column: 28, scope: !22)
!34 = !DILocation(line: 33, column: 21, scope: !22)
!35 = !DILocation(line: 33, column: 19, scope: !22)
!36 = !DILocation(line: 36, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !22, file: !16, line: 36, column: 9)
!38 = !DILocation(line: 36, column: 14, scope: !37)
!39 = !DILocation(line: 36, column: 21, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !16, line: 36, column: 9)
!41 = !DILocation(line: 36, column: 25, scope: !40)
!42 = !DILocation(line: 36, column: 35, scope: !40)
!43 = !DILocation(line: 36, column: 23, scope: !40)
!44 = !DILocation(line: 36, column: 9, scope: !37)
!45 = !DILocation(line: 38, column: 30, scope: !46)
!46 = distinct !DILexicalBlock(scope: !40, file: !16, line: 37, column: 9)
!47 = !DILocation(line: 38, column: 23, scope: !46)
!48 = !DILocation(line: 38, column: 13, scope: !46)
!49 = !DILocation(line: 38, column: 18, scope: !46)
!50 = !DILocation(line: 38, column: 21, scope: !46)
!51 = !DILocation(line: 39, column: 9, scope: !46)
!52 = !DILocation(line: 36, column: 41, scope: !40)
!53 = !DILocation(line: 36, column: 9, scope: !40)
!54 = distinct !{!54, !44, !55, !56}
!55 = !DILocation(line: 39, column: 9, scope: !37)
!56 = !{!"llvm.loop.mustprogress"}
!57 = !DILocation(line: 40, column: 20, scope: !22)
!58 = !DILocation(line: 40, column: 9, scope: !22)
!59 = !DILocation(line: 42, column: 1, scope: !15)
!60 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_41_bad", scope: !16, file: !16, line: 44, type: !61, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{null}
!63 = !DILocalVariable(name: "data", scope: !60, file: !16, line: 46, type: !4)
!64 = !DILocation(line: 46, column: 15, scope: !60)
!65 = !DILocalVariable(name: "dataBadBuffer", scope: !60, file: !16, line: 47, type: !4)
!66 = !DILocation(line: 47, column: 15, scope: !60)
!67 = !DILocation(line: 47, column: 42, scope: !60)
!68 = !DILocation(line: 47, column: 31, scope: !60)
!69 = !DILocalVariable(name: "dataGoodBuffer", scope: !60, file: !16, line: 48, type: !4)
!70 = !DILocation(line: 48, column: 15, scope: !60)
!71 = !DILocation(line: 48, column: 43, scope: !60)
!72 = !DILocation(line: 48, column: 32, scope: !60)
!73 = !DILocation(line: 51, column: 12, scope: !60)
!74 = !DILocation(line: 51, column: 10, scope: !60)
!75 = !DILocation(line: 52, column: 5, scope: !60)
!76 = !DILocation(line: 52, column: 13, scope: !60)
!77 = !DILocation(line: 53, column: 79, scope: !60)
!78 = !DILocation(line: 53, column: 5, scope: !60)
!79 = !DILocation(line: 54, column: 1, scope: !60)
!80 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_41_goodG2BSink", scope: !16, file: !16, line: 60, type: !17, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", arg: 1, scope: !80, file: !16, line: 60, type: !4)
!82 = !DILocation(line: 60, column: 94, scope: !80)
!83 = !DILocalVariable(name: "source", scope: !84, file: !16, line: 63, type: !23)
!84 = distinct !DILexicalBlock(scope: !80, file: !16, line: 62, column: 5)
!85 = !DILocation(line: 63, column: 17, scope: !84)
!86 = !DILocalVariable(name: "i", scope: !84, file: !16, line: 64, type: !28)
!87 = !DILocation(line: 64, column: 16, scope: !84)
!88 = !DILocalVariable(name: "sourceLen", scope: !84, file: !16, line: 64, type: !28)
!89 = !DILocation(line: 64, column: 19, scope: !84)
!90 = !DILocation(line: 65, column: 28, scope: !84)
!91 = !DILocation(line: 65, column: 21, scope: !84)
!92 = !DILocation(line: 65, column: 19, scope: !84)
!93 = !DILocation(line: 68, column: 16, scope: !94)
!94 = distinct !DILexicalBlock(scope: !84, file: !16, line: 68, column: 9)
!95 = !DILocation(line: 68, column: 14, scope: !94)
!96 = !DILocation(line: 68, column: 21, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !16, line: 68, column: 9)
!98 = !DILocation(line: 68, column: 25, scope: !97)
!99 = !DILocation(line: 68, column: 35, scope: !97)
!100 = !DILocation(line: 68, column: 23, scope: !97)
!101 = !DILocation(line: 68, column: 9, scope: !94)
!102 = !DILocation(line: 70, column: 30, scope: !103)
!103 = distinct !DILexicalBlock(scope: !97, file: !16, line: 69, column: 9)
!104 = !DILocation(line: 70, column: 23, scope: !103)
!105 = !DILocation(line: 70, column: 13, scope: !103)
!106 = !DILocation(line: 70, column: 18, scope: !103)
!107 = !DILocation(line: 70, column: 21, scope: !103)
!108 = !DILocation(line: 71, column: 9, scope: !103)
!109 = !DILocation(line: 68, column: 41, scope: !97)
!110 = !DILocation(line: 68, column: 9, scope: !97)
!111 = distinct !{!111, !101, !112, !56}
!112 = !DILocation(line: 71, column: 9, scope: !94)
!113 = !DILocation(line: 72, column: 20, scope: !84)
!114 = !DILocation(line: 72, column: 9, scope: !84)
!115 = !DILocation(line: 74, column: 1, scope: !80)
!116 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_41_good", scope: !16, file: !16, line: 89, type: !61, scopeLine: 90, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!117 = !DILocation(line: 91, column: 5, scope: !116)
!118 = !DILocation(line: 92, column: 1, scope: !116)
!119 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 104, type: !120, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!120 = !DISubroutineType(types: !121)
!121 = !{!7, !7, !122}
!122 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !123, size: 64)
!123 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !124, size: 64)
!124 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!125 = !DILocalVariable(name: "argc", arg: 1, scope: !119, file: !16, line: 104, type: !7)
!126 = !DILocation(line: 104, column: 14, scope: !119)
!127 = !DILocalVariable(name: "argv", arg: 2, scope: !119, file: !16, line: 104, type: !122)
!128 = !DILocation(line: 104, column: 27, scope: !119)
!129 = !DILocation(line: 107, column: 22, scope: !119)
!130 = !DILocation(line: 107, column: 12, scope: !119)
!131 = !DILocation(line: 107, column: 5, scope: !119)
!132 = !DILocation(line: 109, column: 5, scope: !119)
!133 = !DILocation(line: 110, column: 5, scope: !119)
!134 = !DILocation(line: 111, column: 5, scope: !119)
!135 = !DILocation(line: 114, column: 5, scope: !119)
!136 = !DILocation(line: 115, column: 5, scope: !119)
!137 = !DILocation(line: 116, column: 5, scope: !119)
!138 = !DILocation(line: 118, column: 5, scope: !119)
!139 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 77, type: !61, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!140 = !DILocalVariable(name: "data", scope: !139, file: !16, line: 79, type: !4)
!141 = !DILocation(line: 79, column: 15, scope: !139)
!142 = !DILocalVariable(name: "dataBadBuffer", scope: !139, file: !16, line: 80, type: !4)
!143 = !DILocation(line: 80, column: 15, scope: !139)
!144 = !DILocation(line: 80, column: 42, scope: !139)
!145 = !DILocation(line: 80, column: 31, scope: !139)
!146 = !DILocalVariable(name: "dataGoodBuffer", scope: !139, file: !16, line: 81, type: !4)
!147 = !DILocation(line: 81, column: 15, scope: !139)
!148 = !DILocation(line: 81, column: 43, scope: !139)
!149 = !DILocation(line: 81, column: 32, scope: !139)
!150 = !DILocation(line: 84, column: 12, scope: !139)
!151 = !DILocation(line: 84, column: 10, scope: !139)
!152 = !DILocation(line: 85, column: 5, scope: !139)
!153 = !DILocation(line: 85, column: 13, scope: !139)
!154 = !DILocation(line: 86, column: 83, scope: !139)
!155 = !DILocation(line: 86, column: 5, scope: !139)
!156 = !DILocation(line: 87, column: 1, scope: !139)
