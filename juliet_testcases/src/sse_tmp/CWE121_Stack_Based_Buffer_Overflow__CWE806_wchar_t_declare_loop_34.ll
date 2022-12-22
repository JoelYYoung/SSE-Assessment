; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34_unionType, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34_unionType* %myUnion, metadata !21, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !33
  store i32* %arraydecay, i32** %data, align 8, !dbg !34
  %0 = load i32*, i32** %data, align 8, !dbg !35
  %call = call i32* @wmemset(i32* %0, i32 65, i64 99) #6, !dbg !36
  %1 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  %2 = load i32*, i32** %data, align 8, !dbg !39
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34_unionType* %myUnion to i32**, !dbg !40
  store i32* %2, i32** %unionFirst, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !42, metadata !DIExpression()), !dbg !44
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34_unionType* %myUnion to i32**, !dbg !45
  %3 = load i32*, i32** %unionSecond, align 8, !dbg !45
  store i32* %3, i32** %data1, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !46, metadata !DIExpression()), !dbg !51
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %i, metadata !52, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !56, metadata !DIExpression()), !dbg !57
  %5 = load i32*, i32** %data1, align 8, !dbg !58
  %call2 = call i64 @wcslen(i32* %5) #7, !dbg !59
  store i64 %call2, i64* %dataLen, align 8, !dbg !60
  store i64 0, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !63

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !64
  %7 = load i64, i64* %dataLen, align 8, !dbg !66
  %cmp = icmp ult i64 %6, %7, !dbg !67
  br i1 %cmp, label %for.body, label %for.end, !dbg !68

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data1, align 8, !dbg !69
  %9 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx3 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !69
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !69
  %11 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !73
  store i32 %10, i32* %arrayidx4, align 4, !dbg !74
  br label %for.inc, !dbg !75

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !76
  %inc = add i64 %12, 1, !dbg !76
  store i64 %inc, i64* %i, align 8, !dbg !76
  br label %for.cond, !dbg !77, !llvm.loop !78

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !81
  store i32 0, i32* %arrayidx5, align 4, !dbg !82
  %13 = load i32*, i32** %data1, align 8, !dbg !83
  call void @printWLine(i32* %13), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34_good() #0 !dbg !86 {
entry:
  call void @goodG2B(), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !89 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !95, metadata !DIExpression()), !dbg !96
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !97, metadata !DIExpression()), !dbg !98
  %call = call i64 @time(i64* null) #6, !dbg !99
  %conv = trunc i64 %call to i32, !dbg !100
  call void @srand(i32 %conv) #6, !dbg !101
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !102
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34_good(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !105
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34_bad(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !107
  ret i32 0, !dbg !108
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !109 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34_unionType, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34_unionType* %myUnion, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !116
  store i32* %arraydecay, i32** %data, align 8, !dbg !117
  %0 = load i32*, i32** %data, align 8, !dbg !118
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #6, !dbg !119
  %1 = load i32*, i32** %data, align 8, !dbg !120
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !120
  store i32 0, i32* %arrayidx, align 4, !dbg !121
  %2 = load i32*, i32** %data, align 8, !dbg !122
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34_unionType* %myUnion to i32**, !dbg !123
  store i32* %2, i32** %unionFirst, align 8, !dbg !124
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !125, metadata !DIExpression()), !dbg !127
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34_unionType* %myUnion to i32**, !dbg !128
  %3 = load i32*, i32** %unionSecond, align 8, !dbg !128
  store i32* %3, i32** %data1, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !129, metadata !DIExpression()), !dbg !131
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !131
  call void @llvm.dbg.declare(metadata i64* %i, metadata !132, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !134, metadata !DIExpression()), !dbg !135
  %5 = load i32*, i32** %data1, align 8, !dbg !136
  %call2 = call i64 @wcslen(i32* %5) #7, !dbg !137
  store i64 %call2, i64* %dataLen, align 8, !dbg !138
  store i64 0, i64* %i, align 8, !dbg !139
  br label %for.cond, !dbg !141

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !142
  %7 = load i64, i64* %dataLen, align 8, !dbg !144
  %cmp = icmp ult i64 %6, %7, !dbg !145
  br i1 %cmp, label %for.body, label %for.end, !dbg !146

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data1, align 8, !dbg !147
  %9 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx3 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !147
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !147
  %11 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !151
  store i32 %10, i32* %arrayidx4, align 4, !dbg !152
  br label %for.inc, !dbg !153

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !154
  %inc = add i64 %12, 1, !dbg !154
  store i64 %inc, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !155, !llvm.loop !156

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !158
  store i32 0, i32* %arrayidx5, align 4, !dbg !159
  %13 = load i32*, i32** %data1, align 8, !dbg !160
  call void @printWLine(i32* %13), !dbg !161
  ret void, !dbg !162
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 31, column: 15, scope: !11)
!21 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34_unionType", file: !12, line: 25, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 21, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !23, file: !12, line: 23, baseType: !16, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !23, file: !12, line: 24, baseType: !16, size: 64)
!27 = !DILocation(line: 32, column: 82, scope: !11)
!28 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 33, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 33, column: 13, scope: !11)
!33 = !DILocation(line: 34, column: 12, scope: !11)
!34 = !DILocation(line: 34, column: 10, scope: !11)
!35 = !DILocation(line: 36, column: 13, scope: !11)
!36 = !DILocation(line: 36, column: 5, scope: !11)
!37 = !DILocation(line: 37, column: 5, scope: !11)
!38 = !DILocation(line: 37, column: 17, scope: !11)
!39 = !DILocation(line: 38, column: 26, scope: !11)
!40 = !DILocation(line: 38, column: 13, scope: !11)
!41 = !DILocation(line: 38, column: 24, scope: !11)
!42 = !DILocalVariable(name: "data", scope: !43, file: !12, line: 40, type: !16)
!43 = distinct !DILexicalBlock(scope: !11, file: !12, line: 39, column: 5)
!44 = !DILocation(line: 40, column: 19, scope: !43)
!45 = !DILocation(line: 40, column: 34, scope: !43)
!46 = !DILocalVariable(name: "dest", scope: !47, file: !12, line: 42, type: !48)
!47 = distinct !DILexicalBlock(scope: !43, file: !12, line: 41, column: 9)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 50)
!51 = !DILocation(line: 42, column: 21, scope: !47)
!52 = !DILocalVariable(name: "i", scope: !47, file: !12, line: 43, type: !53)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !54)
!54 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!55 = !DILocation(line: 43, column: 20, scope: !47)
!56 = !DILocalVariable(name: "dataLen", scope: !47, file: !12, line: 43, type: !53)
!57 = !DILocation(line: 43, column: 23, scope: !47)
!58 = !DILocation(line: 44, column: 30, scope: !47)
!59 = !DILocation(line: 44, column: 23, scope: !47)
!60 = !DILocation(line: 44, column: 21, scope: !47)
!61 = !DILocation(line: 46, column: 20, scope: !62)
!62 = distinct !DILexicalBlock(scope: !47, file: !12, line: 46, column: 13)
!63 = !DILocation(line: 46, column: 18, scope: !62)
!64 = !DILocation(line: 46, column: 25, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !12, line: 46, column: 13)
!66 = !DILocation(line: 46, column: 29, scope: !65)
!67 = !DILocation(line: 46, column: 27, scope: !65)
!68 = !DILocation(line: 46, column: 13, scope: !62)
!69 = !DILocation(line: 48, column: 27, scope: !70)
!70 = distinct !DILexicalBlock(scope: !65, file: !12, line: 47, column: 13)
!71 = !DILocation(line: 48, column: 32, scope: !70)
!72 = !DILocation(line: 48, column: 22, scope: !70)
!73 = !DILocation(line: 48, column: 17, scope: !70)
!74 = !DILocation(line: 48, column: 25, scope: !70)
!75 = !DILocation(line: 49, column: 13, scope: !70)
!76 = !DILocation(line: 46, column: 39, scope: !65)
!77 = !DILocation(line: 46, column: 13, scope: !65)
!78 = distinct !{!78, !68, !79, !80}
!79 = !DILocation(line: 49, column: 13, scope: !62)
!80 = !{!"llvm.loop.mustprogress"}
!81 = !DILocation(line: 50, column: 13, scope: !47)
!82 = !DILocation(line: 50, column: 24, scope: !47)
!83 = !DILocation(line: 51, column: 24, scope: !47)
!84 = !DILocation(line: 51, column: 13, scope: !47)
!85 = !DILocation(line: 54, column: 1, scope: !11)
!86 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34_good", scope: !12, file: !12, line: 88, type: !13, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocation(line: 90, column: 5, scope: !86)
!88 = !DILocation(line: 91, column: 1, scope: !86)
!89 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 102, type: !90, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DISubroutineType(types: !91)
!91 = !{!19, !19, !92}
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!95 = !DILocalVariable(name: "argc", arg: 1, scope: !89, file: !12, line: 102, type: !19)
!96 = !DILocation(line: 102, column: 14, scope: !89)
!97 = !DILocalVariable(name: "argv", arg: 2, scope: !89, file: !12, line: 102, type: !92)
!98 = !DILocation(line: 102, column: 27, scope: !89)
!99 = !DILocation(line: 105, column: 22, scope: !89)
!100 = !DILocation(line: 105, column: 12, scope: !89)
!101 = !DILocation(line: 105, column: 5, scope: !89)
!102 = !DILocation(line: 107, column: 5, scope: !89)
!103 = !DILocation(line: 108, column: 5, scope: !89)
!104 = !DILocation(line: 109, column: 5, scope: !89)
!105 = !DILocation(line: 112, column: 5, scope: !89)
!106 = !DILocation(line: 113, column: 5, scope: !89)
!107 = !DILocation(line: 114, column: 5, scope: !89)
!108 = !DILocation(line: 116, column: 5, scope: !89)
!109 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocalVariable(name: "data", scope: !109, file: !12, line: 63, type: !16)
!111 = !DILocation(line: 63, column: 15, scope: !109)
!112 = !DILocalVariable(name: "myUnion", scope: !109, file: !12, line: 64, type: !22)
!113 = !DILocation(line: 64, column: 82, scope: !109)
!114 = !DILocalVariable(name: "dataBuffer", scope: !109, file: !12, line: 65, type: !29)
!115 = !DILocation(line: 65, column: 13, scope: !109)
!116 = !DILocation(line: 66, column: 12, scope: !109)
!117 = !DILocation(line: 66, column: 10, scope: !109)
!118 = !DILocation(line: 68, column: 13, scope: !109)
!119 = !DILocation(line: 68, column: 5, scope: !109)
!120 = !DILocation(line: 69, column: 5, scope: !109)
!121 = !DILocation(line: 69, column: 16, scope: !109)
!122 = !DILocation(line: 70, column: 26, scope: !109)
!123 = !DILocation(line: 70, column: 13, scope: !109)
!124 = !DILocation(line: 70, column: 24, scope: !109)
!125 = !DILocalVariable(name: "data", scope: !126, file: !12, line: 72, type: !16)
!126 = distinct !DILexicalBlock(scope: !109, file: !12, line: 71, column: 5)
!127 = !DILocation(line: 72, column: 19, scope: !126)
!128 = !DILocation(line: 72, column: 34, scope: !126)
!129 = !DILocalVariable(name: "dest", scope: !130, file: !12, line: 74, type: !48)
!130 = distinct !DILexicalBlock(scope: !126, file: !12, line: 73, column: 9)
!131 = !DILocation(line: 74, column: 21, scope: !130)
!132 = !DILocalVariable(name: "i", scope: !130, file: !12, line: 75, type: !53)
!133 = !DILocation(line: 75, column: 20, scope: !130)
!134 = !DILocalVariable(name: "dataLen", scope: !130, file: !12, line: 75, type: !53)
!135 = !DILocation(line: 75, column: 23, scope: !130)
!136 = !DILocation(line: 76, column: 30, scope: !130)
!137 = !DILocation(line: 76, column: 23, scope: !130)
!138 = !DILocation(line: 76, column: 21, scope: !130)
!139 = !DILocation(line: 78, column: 20, scope: !140)
!140 = distinct !DILexicalBlock(scope: !130, file: !12, line: 78, column: 13)
!141 = !DILocation(line: 78, column: 18, scope: !140)
!142 = !DILocation(line: 78, column: 25, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !12, line: 78, column: 13)
!144 = !DILocation(line: 78, column: 29, scope: !143)
!145 = !DILocation(line: 78, column: 27, scope: !143)
!146 = !DILocation(line: 78, column: 13, scope: !140)
!147 = !DILocation(line: 80, column: 27, scope: !148)
!148 = distinct !DILexicalBlock(scope: !143, file: !12, line: 79, column: 13)
!149 = !DILocation(line: 80, column: 32, scope: !148)
!150 = !DILocation(line: 80, column: 22, scope: !148)
!151 = !DILocation(line: 80, column: 17, scope: !148)
!152 = !DILocation(line: 80, column: 25, scope: !148)
!153 = !DILocation(line: 81, column: 13, scope: !148)
!154 = !DILocation(line: 78, column: 39, scope: !143)
!155 = !DILocation(line: 78, column: 13, scope: !143)
!156 = distinct !{!156, !146, !157, !80}
!157 = !DILocation(line: 81, column: 13, scope: !140)
!158 = !DILocation(line: 82, column: 13, scope: !130)
!159 = !DILocation(line: 82, column: 24, scope: !130)
!160 = !DILocation(line: 83, column: 24, scope: !130)
!161 = !DILocation(line: 83, column: 13, scope: !130)
!162 = !DILocation(line: 86, column: 1, scope: !109)
