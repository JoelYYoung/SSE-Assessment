; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34_unionType = type { i32* }

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34_unionType, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %data1 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34_unionType* %myUnion, metadata !21, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !33, metadata !DIExpression()), !dbg !37
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store i32* %arraydecay, i32** %data, align 8, !dbg !39
  %0 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  %1 = load i32*, i32** %data, align 8, !dbg !42
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34_unionType* %myUnion to i32**, !dbg !43
  store i32* %1, i32** %unionFirst, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !45, metadata !DIExpression()), !dbg !47
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34_unionType* %myUnion to i32**, !dbg !48
  %2 = load i32*, i32** %unionSecond, align 8, !dbg !48
  store i32* %2, i32** %data1, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !49, metadata !DIExpression()), !dbg !51
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !51
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34_bad.source to i8*), i64 44, i1 false), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %i, metadata !52, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !56, metadata !DIExpression()), !dbg !57
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !58
  %call = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !59
  store i64 %call, i64* %sourceLen, align 8, !dbg !60
  store i64 0, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !63

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !64
  %5 = load i64, i64* %sourceLen, align 8, !dbg !66
  %add = add i64 %5, 1, !dbg !67
  %cmp = icmp ult i64 %4, %add, !dbg !68
  br i1 %cmp, label %for.body, label %for.end, !dbg !69

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %6, !dbg !72
  %7 = load i32, i32* %arrayidx3, align 4, !dbg !72
  %8 = load i32*, i32** %data1, align 8, !dbg !73
  %9 = load i64, i64* %i, align 8, !dbg !74
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !73
  store i32 %7, i32* %arrayidx4, align 4, !dbg !75
  br label %for.inc, !dbg !76

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !77
  %inc = add i64 %10, 1, !dbg !77
  store i64 %inc, i64* %i, align 8, !dbg !77
  br label %for.cond, !dbg !78, !llvm.loop !79

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data1, align 8, !dbg !82
  call void @printWLine(i32* %11), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34_good() #0 !dbg !85 {
entry:
  call void @goodG2B(), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !88 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !94, metadata !DIExpression()), !dbg !95
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !96, metadata !DIExpression()), !dbg !97
  %call = call i64 @time(i64* null) #7, !dbg !98
  %conv = trunc i64 %call to i32, !dbg !99
  call void @srand(i32 %conv) #7, !dbg !100
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !101
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34_good(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !104
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34_bad(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !106
  ret i32 0, !dbg !107
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !108 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34_unionType, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %data1 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34_unionType* %myUnion, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !117
  store i32* %arraydecay, i32** %data, align 8, !dbg !118
  %0 = load i32*, i32** %data, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !119
  store i32 0, i32* %arrayidx, align 4, !dbg !120
  %1 = load i32*, i32** %data, align 8, !dbg !121
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34_unionType* %myUnion to i32**, !dbg !122
  store i32* %1, i32** %unionFirst, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !124, metadata !DIExpression()), !dbg !126
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34_unionType* %myUnion to i32**, !dbg !127
  %2 = load i32*, i32** %unionSecond, align 8, !dbg !127
  store i32* %2, i32** %data1, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !128, metadata !DIExpression()), !dbg !130
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !130
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !130
  call void @llvm.dbg.declare(metadata i64* %i, metadata !131, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !133, metadata !DIExpression()), !dbg !134
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !135
  %call = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !136
  store i64 %call, i64* %sourceLen, align 8, !dbg !137
  store i64 0, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !141
  %5 = load i64, i64* %sourceLen, align 8, !dbg !143
  %add = add i64 %5, 1, !dbg !144
  %cmp = icmp ult i64 %4, %add, !dbg !145
  br i1 %cmp, label %for.body, label %for.end, !dbg !146

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %6, !dbg !149
  %7 = load i32, i32* %arrayidx3, align 4, !dbg !149
  %8 = load i32*, i32** %data1, align 8, !dbg !150
  %9 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !150
  store i32 %7, i32* %arrayidx4, align 4, !dbg !152
  br label %for.inc, !dbg !153

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !154
  %inc = add i64 %10, 1, !dbg !154
  store i64 %inc, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !155, !llvm.loop !156

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data1, align 8, !dbg !158
  call void @printWLine(i32* %11), !dbg !159
  ret void, !dbg !160
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34_bad", scope: !12, file: !12, line: 34, type: !13, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 36, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 36, column: 15, scope: !11)
!21 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 37, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34_unionType", file: !12, line: 30, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 26, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !23, file: !12, line: 28, baseType: !16, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !23, file: !12, line: 29, baseType: !16, size: 64)
!27 = !DILocation(line: 37, column: 82, scope: !11)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 38, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 10)
!32 = !DILocation(line: 38, column: 13, scope: !11)
!33 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 39, type: !34)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 352, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 11)
!37 = !DILocation(line: 39, column: 13, scope: !11)
!38 = !DILocation(line: 42, column: 12, scope: !11)
!39 = !DILocation(line: 42, column: 10, scope: !11)
!40 = !DILocation(line: 43, column: 5, scope: !11)
!41 = !DILocation(line: 43, column: 13, scope: !11)
!42 = !DILocation(line: 44, column: 26, scope: !11)
!43 = !DILocation(line: 44, column: 13, scope: !11)
!44 = !DILocation(line: 44, column: 24, scope: !11)
!45 = !DILocalVariable(name: "data", scope: !46, file: !12, line: 46, type: !16)
!46 = distinct !DILexicalBlock(scope: !11, file: !12, line: 45, column: 5)
!47 = !DILocation(line: 46, column: 19, scope: !46)
!48 = !DILocation(line: 46, column: 34, scope: !46)
!49 = !DILocalVariable(name: "source", scope: !50, file: !12, line: 48, type: !34)
!50 = distinct !DILexicalBlock(scope: !46, file: !12, line: 47, column: 9)
!51 = !DILocation(line: 48, column: 21, scope: !50)
!52 = !DILocalVariable(name: "i", scope: !50, file: !12, line: 49, type: !53)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !54)
!54 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!55 = !DILocation(line: 49, column: 20, scope: !50)
!56 = !DILocalVariable(name: "sourceLen", scope: !50, file: !12, line: 49, type: !53)
!57 = !DILocation(line: 49, column: 23, scope: !50)
!58 = !DILocation(line: 50, column: 32, scope: !50)
!59 = !DILocation(line: 50, column: 25, scope: !50)
!60 = !DILocation(line: 50, column: 23, scope: !50)
!61 = !DILocation(line: 53, column: 20, scope: !62)
!62 = distinct !DILexicalBlock(scope: !50, file: !12, line: 53, column: 13)
!63 = !DILocation(line: 53, column: 18, scope: !62)
!64 = !DILocation(line: 53, column: 25, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !12, line: 53, column: 13)
!66 = !DILocation(line: 53, column: 29, scope: !65)
!67 = !DILocation(line: 53, column: 39, scope: !65)
!68 = !DILocation(line: 53, column: 27, scope: !65)
!69 = !DILocation(line: 53, column: 13, scope: !62)
!70 = !DILocation(line: 55, column: 34, scope: !71)
!71 = distinct !DILexicalBlock(scope: !65, file: !12, line: 54, column: 13)
!72 = !DILocation(line: 55, column: 27, scope: !71)
!73 = !DILocation(line: 55, column: 17, scope: !71)
!74 = !DILocation(line: 55, column: 22, scope: !71)
!75 = !DILocation(line: 55, column: 25, scope: !71)
!76 = !DILocation(line: 56, column: 13, scope: !71)
!77 = !DILocation(line: 53, column: 45, scope: !65)
!78 = !DILocation(line: 53, column: 13, scope: !65)
!79 = distinct !{!79, !69, !80, !81}
!80 = !DILocation(line: 56, column: 13, scope: !62)
!81 = !{!"llvm.loop.mustprogress"}
!82 = !DILocation(line: 57, column: 24, scope: !50)
!83 = !DILocation(line: 57, column: 13, scope: !50)
!84 = !DILocation(line: 60, column: 1, scope: !11)
!85 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34_good", scope: !12, file: !12, line: 95, type: !13, scopeLine: 96, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocation(line: 97, column: 5, scope: !85)
!87 = !DILocation(line: 98, column: 1, scope: !85)
!88 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 109, type: !89, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DISubroutineType(types: !90)
!90 = !{!19, !19, !91}
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !12, line: 109, type: !19)
!95 = !DILocation(line: 109, column: 14, scope: !88)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !12, line: 109, type: !91)
!97 = !DILocation(line: 109, column: 27, scope: !88)
!98 = !DILocation(line: 112, column: 22, scope: !88)
!99 = !DILocation(line: 112, column: 12, scope: !88)
!100 = !DILocation(line: 112, column: 5, scope: !88)
!101 = !DILocation(line: 114, column: 5, scope: !88)
!102 = !DILocation(line: 115, column: 5, scope: !88)
!103 = !DILocation(line: 116, column: 5, scope: !88)
!104 = !DILocation(line: 119, column: 5, scope: !88)
!105 = !DILocation(line: 120, column: 5, scope: !88)
!106 = !DILocation(line: 121, column: 5, scope: !88)
!107 = !DILocation(line: 123, column: 5, scope: !88)
!108 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 67, type: !13, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", scope: !108, file: !12, line: 69, type: !16)
!110 = !DILocation(line: 69, column: 15, scope: !108)
!111 = !DILocalVariable(name: "myUnion", scope: !108, file: !12, line: 70, type: !22)
!112 = !DILocation(line: 70, column: 82, scope: !108)
!113 = !DILocalVariable(name: "dataBadBuffer", scope: !108, file: !12, line: 71, type: !29)
!114 = !DILocation(line: 71, column: 13, scope: !108)
!115 = !DILocalVariable(name: "dataGoodBuffer", scope: !108, file: !12, line: 72, type: !34)
!116 = !DILocation(line: 72, column: 13, scope: !108)
!117 = !DILocation(line: 75, column: 12, scope: !108)
!118 = !DILocation(line: 75, column: 10, scope: !108)
!119 = !DILocation(line: 76, column: 5, scope: !108)
!120 = !DILocation(line: 76, column: 13, scope: !108)
!121 = !DILocation(line: 77, column: 26, scope: !108)
!122 = !DILocation(line: 77, column: 13, scope: !108)
!123 = !DILocation(line: 77, column: 24, scope: !108)
!124 = !DILocalVariable(name: "data", scope: !125, file: !12, line: 79, type: !16)
!125 = distinct !DILexicalBlock(scope: !108, file: !12, line: 78, column: 5)
!126 = !DILocation(line: 79, column: 19, scope: !125)
!127 = !DILocation(line: 79, column: 34, scope: !125)
!128 = !DILocalVariable(name: "source", scope: !129, file: !12, line: 81, type: !34)
!129 = distinct !DILexicalBlock(scope: !125, file: !12, line: 80, column: 9)
!130 = !DILocation(line: 81, column: 21, scope: !129)
!131 = !DILocalVariable(name: "i", scope: !129, file: !12, line: 82, type: !53)
!132 = !DILocation(line: 82, column: 20, scope: !129)
!133 = !DILocalVariable(name: "sourceLen", scope: !129, file: !12, line: 82, type: !53)
!134 = !DILocation(line: 82, column: 23, scope: !129)
!135 = !DILocation(line: 83, column: 32, scope: !129)
!136 = !DILocation(line: 83, column: 25, scope: !129)
!137 = !DILocation(line: 83, column: 23, scope: !129)
!138 = !DILocation(line: 86, column: 20, scope: !139)
!139 = distinct !DILexicalBlock(scope: !129, file: !12, line: 86, column: 13)
!140 = !DILocation(line: 86, column: 18, scope: !139)
!141 = !DILocation(line: 86, column: 25, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !12, line: 86, column: 13)
!143 = !DILocation(line: 86, column: 29, scope: !142)
!144 = !DILocation(line: 86, column: 39, scope: !142)
!145 = !DILocation(line: 86, column: 27, scope: !142)
!146 = !DILocation(line: 86, column: 13, scope: !139)
!147 = !DILocation(line: 88, column: 34, scope: !148)
!148 = distinct !DILexicalBlock(scope: !142, file: !12, line: 87, column: 13)
!149 = !DILocation(line: 88, column: 27, scope: !148)
!150 = !DILocation(line: 88, column: 17, scope: !148)
!151 = !DILocation(line: 88, column: 22, scope: !148)
!152 = !DILocation(line: 88, column: 25, scope: !148)
!153 = !DILocation(line: 89, column: 13, scope: !148)
!154 = !DILocation(line: 86, column: 45, scope: !142)
!155 = !DILocation(line: 86, column: 13, scope: !142)
!156 = distinct !{!156, !146, !157, !81}
!157 = !DILocation(line: 89, column: 13, scope: !139)
!158 = !DILocation(line: 90, column: 24, scope: !129)
!159 = !DILocation(line: 90, column: 13, scope: !129)
!160 = !DILocation(line: 93, column: 1, scope: !108)
