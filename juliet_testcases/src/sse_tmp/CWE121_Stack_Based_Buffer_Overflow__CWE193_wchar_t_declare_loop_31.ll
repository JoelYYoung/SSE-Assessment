; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_31_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !31
  store i32* %arraydecay, i32** %data, align 8, !dbg !32
  %0 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !35, metadata !DIExpression()), !dbg !37
  %1 = load i32*, i32** %data, align 8, !dbg !38
  store i32* %1, i32** %dataCopy, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !39, metadata !DIExpression()), !dbg !40
  %2 = load i32*, i32** %dataCopy, align 8, !dbg !41
  store i32* %2, i32** %data1, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !42, metadata !DIExpression()), !dbg !44
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !44
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_31_bad.source to i8*), i64 44, i1 false), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !49, metadata !DIExpression()), !dbg !50
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !51
  %call = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !52
  store i64 %call, i64* %sourceLen, align 8, !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !57
  %5 = load i64, i64* %sourceLen, align 8, !dbg !59
  %add = add i64 %5, 1, !dbg !60
  %cmp = icmp ult i64 %4, %add, !dbg !61
  br i1 %cmp, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %6, !dbg !65
  %7 = load i32, i32* %arrayidx3, align 4, !dbg !65
  %8 = load i32*, i32** %data1, align 8, !dbg !66
  %9 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !66
  store i32 %7, i32* %arrayidx4, align 4, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !70
  %inc = add i64 %10, 1, !dbg !70
  store i64 %inc, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data1, align 8, !dbg !75
  call void @printWLine(i32* %11), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_31_good() #0 !dbg !78 {
entry:
  call void @goodG2B(), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !81 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !89, metadata !DIExpression()), !dbg !90
  %call = call i64 @time(i64* null) #7, !dbg !91
  %conv = trunc i64 %call to i32, !dbg !92
  call void @srand(i32 %conv) #7, !dbg !93
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_31_good(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_31_bad(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !101 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !108
  store i32* %arraydecay, i32** %data, align 8, !dbg !109
  %0 = load i32*, i32** %data, align 8, !dbg !110
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !110
  store i32 0, i32* %arrayidx, align 4, !dbg !111
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !112, metadata !DIExpression()), !dbg !114
  %1 = load i32*, i32** %data, align 8, !dbg !115
  store i32* %1, i32** %dataCopy, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !116, metadata !DIExpression()), !dbg !117
  %2 = load i32*, i32** %dataCopy, align 8, !dbg !118
  store i32* %2, i32** %data1, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !119, metadata !DIExpression()), !dbg !121
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !121
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !121
  call void @llvm.dbg.declare(metadata i64* %i, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !124, metadata !DIExpression()), !dbg !125
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !126
  %call = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !127
  store i64 %call, i64* %sourceLen, align 8, !dbg !128
  store i64 0, i64* %i, align 8, !dbg !129
  br label %for.cond, !dbg !131

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !132
  %5 = load i64, i64* %sourceLen, align 8, !dbg !134
  %add = add i64 %5, 1, !dbg !135
  %cmp = icmp ult i64 %4, %add, !dbg !136
  br i1 %cmp, label %for.body, label %for.end, !dbg !137

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %6, !dbg !140
  %7 = load i32, i32* %arrayidx3, align 4, !dbg !140
  %8 = load i32*, i32** %data1, align 8, !dbg !141
  %9 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !141
  store i32 %7, i32* %arrayidx4, align 4, !dbg !143
  br label %for.inc, !dbg !144

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !145
  %inc = add i64 %10, 1, !dbg !145
  store i64 %inc, i64* %i, align 8, !dbg !145
  br label %for.cond, !dbg !146, !llvm.loop !147

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data1, align 8, !dbg !149
  call void @printWLine(i32* %11), !dbg !150
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_31.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_31_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_31.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 30, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 10)
!25 = !DILocation(line: 31, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 352, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 11)
!30 = !DILocation(line: 32, column: 13, scope: !11)
!31 = !DILocation(line: 35, column: 12, scope: !11)
!32 = !DILocation(line: 35, column: 10, scope: !11)
!33 = !DILocation(line: 36, column: 5, scope: !11)
!34 = !DILocation(line: 36, column: 13, scope: !11)
!35 = !DILocalVariable(name: "dataCopy", scope: !36, file: !12, line: 38, type: !16)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!37 = !DILocation(line: 38, column: 19, scope: !36)
!38 = !DILocation(line: 38, column: 30, scope: !36)
!39 = !DILocalVariable(name: "data", scope: !36, file: !12, line: 39, type: !16)
!40 = !DILocation(line: 39, column: 19, scope: !36)
!41 = !DILocation(line: 39, column: 26, scope: !36)
!42 = !DILocalVariable(name: "source", scope: !43, file: !12, line: 41, type: !27)
!43 = distinct !DILexicalBlock(scope: !36, file: !12, line: 40, column: 9)
!44 = !DILocation(line: 41, column: 21, scope: !43)
!45 = !DILocalVariable(name: "i", scope: !43, file: !12, line: 42, type: !46)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !47)
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 42, column: 20, scope: !43)
!49 = !DILocalVariable(name: "sourceLen", scope: !43, file: !12, line: 42, type: !46)
!50 = !DILocation(line: 42, column: 23, scope: !43)
!51 = !DILocation(line: 43, column: 32, scope: !43)
!52 = !DILocation(line: 43, column: 25, scope: !43)
!53 = !DILocation(line: 43, column: 23, scope: !43)
!54 = !DILocation(line: 46, column: 20, scope: !55)
!55 = distinct !DILexicalBlock(scope: !43, file: !12, line: 46, column: 13)
!56 = !DILocation(line: 46, column: 18, scope: !55)
!57 = !DILocation(line: 46, column: 25, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !12, line: 46, column: 13)
!59 = !DILocation(line: 46, column: 29, scope: !58)
!60 = !DILocation(line: 46, column: 39, scope: !58)
!61 = !DILocation(line: 46, column: 27, scope: !58)
!62 = !DILocation(line: 46, column: 13, scope: !55)
!63 = !DILocation(line: 48, column: 34, scope: !64)
!64 = distinct !DILexicalBlock(scope: !58, file: !12, line: 47, column: 13)
!65 = !DILocation(line: 48, column: 27, scope: !64)
!66 = !DILocation(line: 48, column: 17, scope: !64)
!67 = !DILocation(line: 48, column: 22, scope: !64)
!68 = !DILocation(line: 48, column: 25, scope: !64)
!69 = !DILocation(line: 49, column: 13, scope: !64)
!70 = !DILocation(line: 46, column: 45, scope: !58)
!71 = !DILocation(line: 46, column: 13, scope: !58)
!72 = distinct !{!72, !62, !73, !74}
!73 = !DILocation(line: 49, column: 13, scope: !55)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocation(line: 50, column: 24, scope: !43)
!76 = !DILocation(line: 50, column: 13, scope: !43)
!77 = !DILocation(line: 53, column: 1, scope: !11)
!78 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_31_good", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocation(line: 89, column: 5, scope: !78)
!80 = !DILocation(line: 90, column: 1, scope: !78)
!81 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 101, type: !82, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DISubroutineType(types: !83)
!83 = !{!19, !19, !84}
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !12, line: 101, type: !19)
!88 = !DILocation(line: 101, column: 14, scope: !81)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !12, line: 101, type: !84)
!90 = !DILocation(line: 101, column: 27, scope: !81)
!91 = !DILocation(line: 104, column: 22, scope: !81)
!92 = !DILocation(line: 104, column: 12, scope: !81)
!93 = !DILocation(line: 104, column: 5, scope: !81)
!94 = !DILocation(line: 106, column: 5, scope: !81)
!95 = !DILocation(line: 107, column: 5, scope: !81)
!96 = !DILocation(line: 108, column: 5, scope: !81)
!97 = !DILocation(line: 111, column: 5, scope: !81)
!98 = !DILocation(line: 112, column: 5, scope: !81)
!99 = !DILocation(line: 113, column: 5, scope: !81)
!100 = !DILocation(line: 115, column: 5, scope: !81)
!101 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !12, line: 62, type: !16)
!103 = !DILocation(line: 62, column: 15, scope: !101)
!104 = !DILocalVariable(name: "dataBadBuffer", scope: !101, file: !12, line: 63, type: !22)
!105 = !DILocation(line: 63, column: 13, scope: !101)
!106 = !DILocalVariable(name: "dataGoodBuffer", scope: !101, file: !12, line: 64, type: !27)
!107 = !DILocation(line: 64, column: 13, scope: !101)
!108 = !DILocation(line: 67, column: 12, scope: !101)
!109 = !DILocation(line: 67, column: 10, scope: !101)
!110 = !DILocation(line: 68, column: 5, scope: !101)
!111 = !DILocation(line: 68, column: 13, scope: !101)
!112 = !DILocalVariable(name: "dataCopy", scope: !113, file: !12, line: 70, type: !16)
!113 = distinct !DILexicalBlock(scope: !101, file: !12, line: 69, column: 5)
!114 = !DILocation(line: 70, column: 19, scope: !113)
!115 = !DILocation(line: 70, column: 30, scope: !113)
!116 = !DILocalVariable(name: "data", scope: !113, file: !12, line: 71, type: !16)
!117 = !DILocation(line: 71, column: 19, scope: !113)
!118 = !DILocation(line: 71, column: 26, scope: !113)
!119 = !DILocalVariable(name: "source", scope: !120, file: !12, line: 73, type: !27)
!120 = distinct !DILexicalBlock(scope: !113, file: !12, line: 72, column: 9)
!121 = !DILocation(line: 73, column: 21, scope: !120)
!122 = !DILocalVariable(name: "i", scope: !120, file: !12, line: 74, type: !46)
!123 = !DILocation(line: 74, column: 20, scope: !120)
!124 = !DILocalVariable(name: "sourceLen", scope: !120, file: !12, line: 74, type: !46)
!125 = !DILocation(line: 74, column: 23, scope: !120)
!126 = !DILocation(line: 75, column: 32, scope: !120)
!127 = !DILocation(line: 75, column: 25, scope: !120)
!128 = !DILocation(line: 75, column: 23, scope: !120)
!129 = !DILocation(line: 78, column: 20, scope: !130)
!130 = distinct !DILexicalBlock(scope: !120, file: !12, line: 78, column: 13)
!131 = !DILocation(line: 78, column: 18, scope: !130)
!132 = !DILocation(line: 78, column: 25, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !12, line: 78, column: 13)
!134 = !DILocation(line: 78, column: 29, scope: !133)
!135 = !DILocation(line: 78, column: 39, scope: !133)
!136 = !DILocation(line: 78, column: 27, scope: !133)
!137 = !DILocation(line: 78, column: 13, scope: !130)
!138 = !DILocation(line: 80, column: 34, scope: !139)
!139 = distinct !DILexicalBlock(scope: !133, file: !12, line: 79, column: 13)
!140 = !DILocation(line: 80, column: 27, scope: !139)
!141 = !DILocation(line: 80, column: 17, scope: !139)
!142 = !DILocation(line: 80, column: 22, scope: !139)
!143 = !DILocation(line: 80, column: 25, scope: !139)
!144 = !DILocation(line: 81, column: 13, scope: !139)
!145 = !DILocation(line: 78, column: 45, scope: !133)
!146 = !DILocation(line: 78, column: 13, scope: !133)
!147 = distinct !{!147, !137, !148, !74}
!148 = !DILocation(line: 81, column: 13, scope: !130)
!149 = !DILocation(line: 82, column: 24, scope: !120)
!150 = !DILocation(line: 82, column: 13, scope: !120)
!151 = !DILocation(line: 85, column: 1, scope: !101)
