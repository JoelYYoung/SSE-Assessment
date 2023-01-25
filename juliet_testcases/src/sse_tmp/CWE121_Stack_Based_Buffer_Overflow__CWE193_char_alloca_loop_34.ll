; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_34_unionType = type { i8* }

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_34_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_34_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_34_unionType, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_34_unionType* %myUnion, metadata !19, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 10, align 16, !dbg !28
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !30
  %1 = alloca i8, i64 11, align 16, !dbg !31
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !30
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !32
  store i8* %2, i8** %data, align 8, !dbg !33
  %3 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  %4 = load i8*, i8** %data, align 8, !dbg !36
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_34_unionType* %myUnion to i8**, !dbg !37
  store i8* %4, i8** %unionFirst, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !39, metadata !DIExpression()), !dbg !41
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_34_unionType* %myUnion to i8**, !dbg !42
  %5 = load i8*, i8** %unionSecond, align 8, !dbg !42
  store i8* %5, i8** %data1, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !43, metadata !DIExpression()), !dbg !48
  %6 = bitcast [11 x i8]* %source to i8*, !dbg !48
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_34_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %i, metadata !49, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !54, metadata !DIExpression()), !dbg !55
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !56
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !57
  store i64 %call, i64* %sourceLen, align 8, !dbg !58
  store i64 0, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !62
  %8 = load i64, i64* %sourceLen, align 8, !dbg !64
  %add = add i64 %8, 1, !dbg !65
  %cmp = icmp ult i64 %7, %add, !dbg !66
  br i1 %cmp, label %for.body, label %for.end, !dbg !67

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %9, !dbg !70
  %10 = load i8, i8* %arrayidx2, align 1, !dbg !70
  %11 = load i8*, i8** %data1, align 8, !dbg !71
  %12 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx3 = getelementptr inbounds i8, i8* %11, i64 %12, !dbg !71
  store i8 %10, i8* %arrayidx3, align 1, !dbg !73
  br label %for.inc, !dbg !74

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !75
  %inc = add i64 %13, 1, !dbg !75
  store i64 %inc, i64* %i, align 8, !dbg !75
  br label %for.cond, !dbg !76, !llvm.loop !77

for.end:                                          ; preds = %for.cond
  %14 = load i8*, i8** %data1, align 8, !dbg !80
  call void @printLine(i8* %14), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_34_good() #0 !dbg !83 {
entry:
  call void @goodG2B(), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !86 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* null) #7, !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 %conv) #7, !dbg !97
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_34_good(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_34_bad(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !105 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_34_unionType, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_34_unionType* %myUnion, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %0 = alloca i8, i64 10, align 16, !dbg !112
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %1 = alloca i8, i64 11, align 16, !dbg !115
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !114
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !116
  store i8* %2, i8** %data, align 8, !dbg !117
  %3 = load i8*, i8** %data, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !118
  store i8 0, i8* %arrayidx, align 1, !dbg !119
  %4 = load i8*, i8** %data, align 8, !dbg !120
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_34_unionType* %myUnion to i8**, !dbg !121
  store i8* %4, i8** %unionFirst, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !123, metadata !DIExpression()), !dbg !125
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_34_unionType* %myUnion to i8**, !dbg !126
  %5 = load i8*, i8** %unionSecond, align 8, !dbg !126
  store i8* %5, i8** %data1, align 8, !dbg !125
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !127, metadata !DIExpression()), !dbg !129
  %6 = bitcast [11 x i8]* %source to i8*, !dbg !129
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !129
  call void @llvm.dbg.declare(metadata i64* %i, metadata !130, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !132, metadata !DIExpression()), !dbg !133
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !134
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !135
  store i64 %call, i64* %sourceLen, align 8, !dbg !136
  store i64 0, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !139

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !140
  %8 = load i64, i64* %sourceLen, align 8, !dbg !142
  %add = add i64 %8, 1, !dbg !143
  %cmp = icmp ult i64 %7, %add, !dbg !144
  br i1 %cmp, label %for.body, label %for.end, !dbg !145

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %9, !dbg !148
  %10 = load i8, i8* %arrayidx2, align 1, !dbg !148
  %11 = load i8*, i8** %data1, align 8, !dbg !149
  %12 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx3 = getelementptr inbounds i8, i8* %11, i64 %12, !dbg !149
  store i8 %10, i8* %arrayidx3, align 1, !dbg !151
  br label %for.inc, !dbg !152

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !153
  %inc = add i64 %13, 1, !dbg !153
  store i64 %inc, i64* %i, align 8, !dbg !153
  br label %for.cond, !dbg !154, !llvm.loop !155

for.end:                                          ; preds = %for.cond
  %14 = load i8*, i8** %data1, align 8, !dbg !157
  call void @printLine(i8* %14), !dbg !158
  ret void, !dbg !159
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_34_bad", scope: !14, file: !14, line: 34, type: !15, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 36, type: !4)
!18 = !DILocation(line: 36, column: 12, scope: !13)
!19 = !DILocalVariable(name: "myUnion", scope: !13, file: !14, line: 37, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_34_unionType", file: !14, line: 30, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !14, line: 26, size: 64, elements: !22)
!22 = !{!23, !24}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !21, file: !14, line: 28, baseType: !4, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !21, file: !14, line: 29, baseType: !4, size: 64)
!25 = !DILocation(line: 37, column: 78, scope: !13)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 38, type: !4)
!27 = !DILocation(line: 38, column: 12, scope: !13)
!28 = !DILocation(line: 38, column: 36, scope: !13)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 39, type: !4)
!30 = !DILocation(line: 39, column: 12, scope: !13)
!31 = !DILocation(line: 39, column: 37, scope: !13)
!32 = !DILocation(line: 42, column: 12, scope: !13)
!33 = !DILocation(line: 42, column: 10, scope: !13)
!34 = !DILocation(line: 43, column: 5, scope: !13)
!35 = !DILocation(line: 43, column: 13, scope: !13)
!36 = !DILocation(line: 44, column: 26, scope: !13)
!37 = !DILocation(line: 44, column: 13, scope: !13)
!38 = !DILocation(line: 44, column: 24, scope: !13)
!39 = !DILocalVariable(name: "data", scope: !40, file: !14, line: 46, type: !4)
!40 = distinct !DILexicalBlock(scope: !13, file: !14, line: 45, column: 5)
!41 = !DILocation(line: 46, column: 16, scope: !40)
!42 = !DILocation(line: 46, column: 31, scope: !40)
!43 = !DILocalVariable(name: "source", scope: !44, file: !14, line: 48, type: !45)
!44 = distinct !DILexicalBlock(scope: !40, file: !14, line: 47, column: 9)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 11)
!48 = !DILocation(line: 48, column: 18, scope: !44)
!49 = !DILocalVariable(name: "i", scope: !44, file: !14, line: 49, type: !50)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !51, line: 46, baseType: !52)
!51 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!52 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!53 = !DILocation(line: 49, column: 20, scope: !44)
!54 = !DILocalVariable(name: "sourceLen", scope: !44, file: !14, line: 49, type: !50)
!55 = !DILocation(line: 49, column: 23, scope: !44)
!56 = !DILocation(line: 50, column: 32, scope: !44)
!57 = !DILocation(line: 50, column: 25, scope: !44)
!58 = !DILocation(line: 50, column: 23, scope: !44)
!59 = !DILocation(line: 53, column: 20, scope: !60)
!60 = distinct !DILexicalBlock(scope: !44, file: !14, line: 53, column: 13)
!61 = !DILocation(line: 53, column: 18, scope: !60)
!62 = !DILocation(line: 53, column: 25, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !14, line: 53, column: 13)
!64 = !DILocation(line: 53, column: 29, scope: !63)
!65 = !DILocation(line: 53, column: 39, scope: !63)
!66 = !DILocation(line: 53, column: 27, scope: !63)
!67 = !DILocation(line: 53, column: 13, scope: !60)
!68 = !DILocation(line: 55, column: 34, scope: !69)
!69 = distinct !DILexicalBlock(scope: !63, file: !14, line: 54, column: 13)
!70 = !DILocation(line: 55, column: 27, scope: !69)
!71 = !DILocation(line: 55, column: 17, scope: !69)
!72 = !DILocation(line: 55, column: 22, scope: !69)
!73 = !DILocation(line: 55, column: 25, scope: !69)
!74 = !DILocation(line: 56, column: 13, scope: !69)
!75 = !DILocation(line: 53, column: 45, scope: !63)
!76 = !DILocation(line: 53, column: 13, scope: !63)
!77 = distinct !{!77, !67, !78, !79}
!78 = !DILocation(line: 56, column: 13, scope: !60)
!79 = !{!"llvm.loop.mustprogress"}
!80 = !DILocation(line: 57, column: 23, scope: !44)
!81 = !DILocation(line: 57, column: 13, scope: !44)
!82 = !DILocation(line: 60, column: 1, scope: !13)
!83 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_34_good", scope: !14, file: !14, line: 95, type: !15, scopeLine: 96, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocation(line: 97, column: 5, scope: !83)
!85 = !DILocation(line: 98, column: 1, scope: !83)
!86 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 109, type: !87, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DISubroutineType(types: !88)
!88 = !{!89, !89, !90}
!89 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !14, line: 109, type: !89)
!92 = !DILocation(line: 109, column: 14, scope: !86)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !14, line: 109, type: !90)
!94 = !DILocation(line: 109, column: 27, scope: !86)
!95 = !DILocation(line: 112, column: 22, scope: !86)
!96 = !DILocation(line: 112, column: 12, scope: !86)
!97 = !DILocation(line: 112, column: 5, scope: !86)
!98 = !DILocation(line: 114, column: 5, scope: !86)
!99 = !DILocation(line: 115, column: 5, scope: !86)
!100 = !DILocation(line: 116, column: 5, scope: !86)
!101 = !DILocation(line: 119, column: 5, scope: !86)
!102 = !DILocation(line: 120, column: 5, scope: !86)
!103 = !DILocation(line: 121, column: 5, scope: !86)
!104 = !DILocation(line: 123, column: 5, scope: !86)
!105 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 67, type: !15, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", scope: !105, file: !14, line: 69, type: !4)
!107 = !DILocation(line: 69, column: 12, scope: !105)
!108 = !DILocalVariable(name: "myUnion", scope: !105, file: !14, line: 70, type: !20)
!109 = !DILocation(line: 70, column: 78, scope: !105)
!110 = !DILocalVariable(name: "dataBadBuffer", scope: !105, file: !14, line: 71, type: !4)
!111 = !DILocation(line: 71, column: 12, scope: !105)
!112 = !DILocation(line: 71, column: 36, scope: !105)
!113 = !DILocalVariable(name: "dataGoodBuffer", scope: !105, file: !14, line: 72, type: !4)
!114 = !DILocation(line: 72, column: 12, scope: !105)
!115 = !DILocation(line: 72, column: 37, scope: !105)
!116 = !DILocation(line: 75, column: 12, scope: !105)
!117 = !DILocation(line: 75, column: 10, scope: !105)
!118 = !DILocation(line: 76, column: 5, scope: !105)
!119 = !DILocation(line: 76, column: 13, scope: !105)
!120 = !DILocation(line: 77, column: 26, scope: !105)
!121 = !DILocation(line: 77, column: 13, scope: !105)
!122 = !DILocation(line: 77, column: 24, scope: !105)
!123 = !DILocalVariable(name: "data", scope: !124, file: !14, line: 79, type: !4)
!124 = distinct !DILexicalBlock(scope: !105, file: !14, line: 78, column: 5)
!125 = !DILocation(line: 79, column: 16, scope: !124)
!126 = !DILocation(line: 79, column: 31, scope: !124)
!127 = !DILocalVariable(name: "source", scope: !128, file: !14, line: 81, type: !45)
!128 = distinct !DILexicalBlock(scope: !124, file: !14, line: 80, column: 9)
!129 = !DILocation(line: 81, column: 18, scope: !128)
!130 = !DILocalVariable(name: "i", scope: !128, file: !14, line: 82, type: !50)
!131 = !DILocation(line: 82, column: 20, scope: !128)
!132 = !DILocalVariable(name: "sourceLen", scope: !128, file: !14, line: 82, type: !50)
!133 = !DILocation(line: 82, column: 23, scope: !128)
!134 = !DILocation(line: 83, column: 32, scope: !128)
!135 = !DILocation(line: 83, column: 25, scope: !128)
!136 = !DILocation(line: 83, column: 23, scope: !128)
!137 = !DILocation(line: 86, column: 20, scope: !138)
!138 = distinct !DILexicalBlock(scope: !128, file: !14, line: 86, column: 13)
!139 = !DILocation(line: 86, column: 18, scope: !138)
!140 = !DILocation(line: 86, column: 25, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !14, line: 86, column: 13)
!142 = !DILocation(line: 86, column: 29, scope: !141)
!143 = !DILocation(line: 86, column: 39, scope: !141)
!144 = !DILocation(line: 86, column: 27, scope: !141)
!145 = !DILocation(line: 86, column: 13, scope: !138)
!146 = !DILocation(line: 88, column: 34, scope: !147)
!147 = distinct !DILexicalBlock(scope: !141, file: !14, line: 87, column: 13)
!148 = !DILocation(line: 88, column: 27, scope: !147)
!149 = !DILocation(line: 88, column: 17, scope: !147)
!150 = !DILocation(line: 88, column: 22, scope: !147)
!151 = !DILocation(line: 88, column: 25, scope: !147)
!152 = !DILocation(line: 89, column: 13, scope: !147)
!153 = !DILocation(line: 86, column: 45, scope: !141)
!154 = !DILocation(line: 86, column: 13, scope: !141)
!155 = distinct !{!155, !145, !156, !79}
!156 = !DILocation(line: 89, column: 13, scope: !138)
!157 = !DILocation(line: 90, column: 23, scope: !128)
!158 = !DILocation(line: 90, column: 13, scope: !128)
!159 = !DILocation(line: 93, column: 1, scope: !105)
