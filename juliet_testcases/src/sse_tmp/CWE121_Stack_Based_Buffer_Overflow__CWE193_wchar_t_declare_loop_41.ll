; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_41_badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_41_goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_41_badSink(i32* %data) #0 !dbg !11 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !21, metadata !DIExpression()), !dbg !26
  %0 = bitcast [11 x i32]* %source to i8*, !dbg !26
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_41_badSink.source to i8*), i64 44, i1 false), !dbg !26
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_41_bad() #0 !dbg !60 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !63, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !65, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !70, metadata !DIExpression()), !dbg !71
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !72
  store i32* %arraydecay, i32** %data, align 8, !dbg !73
  %0 = load i32*, i32** %data, align 8, !dbg !74
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !74
  store i32 0, i32* %arrayidx, align 4, !dbg !75
  %1 = load i32*, i32** %data, align 8, !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_41_badSink(i32* %1), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_41_goodG2BSink(i32* %data) #0 !dbg !79 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !82, metadata !DIExpression()), !dbg !84
  %0 = bitcast [11 x i32]* %source to i8*, !dbg !84
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_41_goodG2BSink.source to i8*), i64 44, i1 false), !dbg !84
  call void @llvm.dbg.declare(metadata i64* %i, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !87, metadata !DIExpression()), !dbg !88
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !89
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !90
  store i64 %call, i64* %sourceLen, align 8, !dbg !91
  store i64 0, i64* %i, align 8, !dbg !92
  br label %for.cond, !dbg !94

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !95
  %2 = load i64, i64* %sourceLen, align 8, !dbg !97
  %add = add i64 %2, 1, !dbg !98
  %cmp = icmp ult i64 %1, %add, !dbg !99
  br i1 %cmp, label %for.body, label %for.end, !dbg !100

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !101
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %3, !dbg !103
  %4 = load i32, i32* %arrayidx, align 4, !dbg !103
  %5 = load i32*, i32** %data.addr, align 8, !dbg !104
  %6 = load i64, i64* %i, align 8, !dbg !105
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !104
  store i32 %4, i32* %arrayidx1, align 4, !dbg !106
  br label %for.inc, !dbg !107

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !108
  %inc = add i64 %7, 1, !dbg !108
  store i64 %inc, i64* %i, align 8, !dbg !108
  br label %for.cond, !dbg !109, !llvm.loop !110

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data.addr, align 8, !dbg !112
  call void @printWLine(i32* %8), !dbg !113
  ret void, !dbg !114
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_41_good() #0 !dbg !115 {
entry:
  call void @goodG2B(), !dbg !116
  ret void, !dbg !117
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !118 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !124, metadata !DIExpression()), !dbg !125
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !126, metadata !DIExpression()), !dbg !127
  %call = call i64 @time(i64* null) #7, !dbg !128
  %conv = trunc i64 %call to i32, !dbg !129
  call void @srand(i32 %conv) #7, !dbg !130
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !131
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_41_good(), !dbg !132
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !133
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !134
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_41_bad(), !dbg !135
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !136
  ret i32 0, !dbg !137
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !138 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !139, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !141, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !143, metadata !DIExpression()), !dbg !144
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !145
  store i32* %arraydecay, i32** %data, align 8, !dbg !146
  %0 = load i32*, i32** %data, align 8, !dbg !147
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !147
  store i32 0, i32* %arrayidx, align 4, !dbg !148
  %1 = load i32*, i32** %data, align 8, !dbg !149
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_41_goodG2BSink(i32* %1), !dbg !150
  ret void, !dbg !151
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_41.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_41_badSink", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_41.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !17, line: 74, baseType: !18)
!17 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 28, type: !15)
!20 = !DILocation(line: 28, column: 91, scope: !11)
!21 = !DILocalVariable(name: "source", scope: !22, file: !12, line: 31, type: !23)
!22 = distinct !DILexicalBlock(scope: !11, file: !12, line: 30, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 352, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 11)
!26 = !DILocation(line: 31, column: 17, scope: !22)
!27 = !DILocalVariable(name: "i", scope: !22, file: !12, line: 32, type: !28)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !17, line: 46, baseType: !29)
!29 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!30 = !DILocation(line: 32, column: 16, scope: !22)
!31 = !DILocalVariable(name: "sourceLen", scope: !22, file: !12, line: 32, type: !28)
!32 = !DILocation(line: 32, column: 19, scope: !22)
!33 = !DILocation(line: 33, column: 28, scope: !22)
!34 = !DILocation(line: 33, column: 21, scope: !22)
!35 = !DILocation(line: 33, column: 19, scope: !22)
!36 = !DILocation(line: 36, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !22, file: !12, line: 36, column: 9)
!38 = !DILocation(line: 36, column: 14, scope: !37)
!39 = !DILocation(line: 36, column: 21, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !12, line: 36, column: 9)
!41 = !DILocation(line: 36, column: 25, scope: !40)
!42 = !DILocation(line: 36, column: 35, scope: !40)
!43 = !DILocation(line: 36, column: 23, scope: !40)
!44 = !DILocation(line: 36, column: 9, scope: !37)
!45 = !DILocation(line: 38, column: 30, scope: !46)
!46 = distinct !DILexicalBlock(scope: !40, file: !12, line: 37, column: 9)
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
!59 = !DILocation(line: 42, column: 1, scope: !11)
!60 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_41_bad", scope: !12, file: !12, line: 44, type: !61, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{null}
!63 = !DILocalVariable(name: "data", scope: !60, file: !12, line: 46, type: !15)
!64 = !DILocation(line: 46, column: 15, scope: !60)
!65 = !DILocalVariable(name: "dataBadBuffer", scope: !60, file: !12, line: 47, type: !66)
!66 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !67)
!67 = !{!68}
!68 = !DISubrange(count: 10)
!69 = !DILocation(line: 47, column: 13, scope: !60)
!70 = !DILocalVariable(name: "dataGoodBuffer", scope: !60, file: !12, line: 48, type: !23)
!71 = !DILocation(line: 48, column: 13, scope: !60)
!72 = !DILocation(line: 51, column: 12, scope: !60)
!73 = !DILocation(line: 51, column: 10, scope: !60)
!74 = !DILocation(line: 52, column: 5, scope: !60)
!75 = !DILocation(line: 52, column: 13, scope: !60)
!76 = !DILocation(line: 53, column: 80, scope: !60)
!77 = !DILocation(line: 53, column: 5, scope: !60)
!78 = !DILocation(line: 54, column: 1, scope: !60)
!79 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_41_goodG2BSink", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", arg: 1, scope: !79, file: !12, line: 60, type: !15)
!81 = !DILocation(line: 60, column: 95, scope: !79)
!82 = !DILocalVariable(name: "source", scope: !83, file: !12, line: 63, type: !23)
!83 = distinct !DILexicalBlock(scope: !79, file: !12, line: 62, column: 5)
!84 = !DILocation(line: 63, column: 17, scope: !83)
!85 = !DILocalVariable(name: "i", scope: !83, file: !12, line: 64, type: !28)
!86 = !DILocation(line: 64, column: 16, scope: !83)
!87 = !DILocalVariable(name: "sourceLen", scope: !83, file: !12, line: 64, type: !28)
!88 = !DILocation(line: 64, column: 19, scope: !83)
!89 = !DILocation(line: 65, column: 28, scope: !83)
!90 = !DILocation(line: 65, column: 21, scope: !83)
!91 = !DILocation(line: 65, column: 19, scope: !83)
!92 = !DILocation(line: 68, column: 16, scope: !93)
!93 = distinct !DILexicalBlock(scope: !83, file: !12, line: 68, column: 9)
!94 = !DILocation(line: 68, column: 14, scope: !93)
!95 = !DILocation(line: 68, column: 21, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !12, line: 68, column: 9)
!97 = !DILocation(line: 68, column: 25, scope: !96)
!98 = !DILocation(line: 68, column: 35, scope: !96)
!99 = !DILocation(line: 68, column: 23, scope: !96)
!100 = !DILocation(line: 68, column: 9, scope: !93)
!101 = !DILocation(line: 70, column: 30, scope: !102)
!102 = distinct !DILexicalBlock(scope: !96, file: !12, line: 69, column: 9)
!103 = !DILocation(line: 70, column: 23, scope: !102)
!104 = !DILocation(line: 70, column: 13, scope: !102)
!105 = !DILocation(line: 70, column: 18, scope: !102)
!106 = !DILocation(line: 70, column: 21, scope: !102)
!107 = !DILocation(line: 71, column: 9, scope: !102)
!108 = !DILocation(line: 68, column: 41, scope: !96)
!109 = !DILocation(line: 68, column: 9, scope: !96)
!110 = distinct !{!110, !100, !111, !56}
!111 = !DILocation(line: 71, column: 9, scope: !93)
!112 = !DILocation(line: 72, column: 20, scope: !83)
!113 = !DILocation(line: 72, column: 9, scope: !83)
!114 = !DILocation(line: 74, column: 1, scope: !79)
!115 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_41_good", scope: !12, file: !12, line: 89, type: !61, scopeLine: 90, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DILocation(line: 91, column: 5, scope: !115)
!117 = !DILocation(line: 92, column: 1, scope: !115)
!118 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 104, type: !119, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!119 = !DISubroutineType(types: !120)
!120 = !{!18, !18, !121}
!121 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !122, size: 64)
!122 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !123, size: 64)
!123 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!124 = !DILocalVariable(name: "argc", arg: 1, scope: !118, file: !12, line: 104, type: !18)
!125 = !DILocation(line: 104, column: 14, scope: !118)
!126 = !DILocalVariable(name: "argv", arg: 2, scope: !118, file: !12, line: 104, type: !121)
!127 = !DILocation(line: 104, column: 27, scope: !118)
!128 = !DILocation(line: 107, column: 22, scope: !118)
!129 = !DILocation(line: 107, column: 12, scope: !118)
!130 = !DILocation(line: 107, column: 5, scope: !118)
!131 = !DILocation(line: 109, column: 5, scope: !118)
!132 = !DILocation(line: 110, column: 5, scope: !118)
!133 = !DILocation(line: 111, column: 5, scope: !118)
!134 = !DILocation(line: 114, column: 5, scope: !118)
!135 = !DILocation(line: 115, column: 5, scope: !118)
!136 = !DILocation(line: 116, column: 5, scope: !118)
!137 = !DILocation(line: 118, column: 5, scope: !118)
!138 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 77, type: !61, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!139 = !DILocalVariable(name: "data", scope: !138, file: !12, line: 79, type: !15)
!140 = !DILocation(line: 79, column: 15, scope: !138)
!141 = !DILocalVariable(name: "dataBadBuffer", scope: !138, file: !12, line: 80, type: !66)
!142 = !DILocation(line: 80, column: 13, scope: !138)
!143 = !DILocalVariable(name: "dataGoodBuffer", scope: !138, file: !12, line: 81, type: !23)
!144 = !DILocation(line: 81, column: 13, scope: !138)
!145 = !DILocation(line: 84, column: 12, scope: !138)
!146 = !DILocation(line: 84, column: 10, scope: !138)
!147 = !DILocation(line: 85, column: 5, scope: !138)
!148 = !DILocation(line: 85, column: 13, scope: !138)
!149 = !DILocation(line: 86, column: 84, scope: !138)
!150 = !DILocation(line: 86, column: 5, scope: !138)
!151 = !DILocation(line: 87, column: 1, scope: !138)
