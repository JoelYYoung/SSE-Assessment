; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_34.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_34_unionType = type { i32* }

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_34_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_34_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_34_unionType, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_34_unionType* %myUnion, metadata !22, metadata !DIExpression()), !dbg !28
  store i32* null, i32** %data, align 8, !dbg !29
  %call = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !30
  %0 = bitcast i8* %call to i32*, !dbg !31
  store i32* %0, i32** %data, align 8, !dbg !32
  %1 = load i32*, i32** %data, align 8, !dbg !33
  %cmp = icmp eq i32* %1, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !39
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_34_unionType* %myUnion to i32**, !dbg !40
  store i32* %2, i32** %unionFirst, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !42, metadata !DIExpression()), !dbg !44
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_34_unionType* %myUnion to i32**, !dbg !45
  %3 = load i32*, i32** %unionSecond, align 8, !dbg !45
  store i32* %3, i32** %data1, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !46, metadata !DIExpression()), !dbg !51
  %4 = bitcast [11 x i32]* %source to i8*, !dbg !51
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_34_bad.source to i8*), i64 44, i1 false), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %i, metadata !52, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !56, metadata !DIExpression()), !dbg !57
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !58
  %call2 = call i64 @wcslen(i32* %arraydecay) #9, !dbg !59
  store i64 %call2, i64* %sourceLen, align 8, !dbg !60
  store i64 0, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !63

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !64
  %6 = load i64, i64* %sourceLen, align 8, !dbg !66
  %add = add i64 %6, 1, !dbg !67
  %cmp3 = icmp ult i64 %5, %add, !dbg !68
  br i1 %cmp3, label %for.body, label %for.end, !dbg !69

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %7, !dbg !72
  %8 = load i32, i32* %arrayidx, align 4, !dbg !72
  %9 = load i32*, i32** %data1, align 8, !dbg !73
  %10 = load i64, i64* %i, align 8, !dbg !74
  %arrayidx4 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !73
  store i32 %8, i32* %arrayidx4, align 4, !dbg !75
  br label %for.inc, !dbg !76

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !77
  %inc = add i64 %11, 1, !dbg !77
  store i64 %inc, i64* %i, align 8, !dbg !77
  br label %for.cond, !dbg !78, !llvm.loop !79

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data1, align 8, !dbg !82
  call void @printWLine(i32* %12), !dbg !83
  %13 = load i32*, i32** %data1, align 8, !dbg !84
  %14 = bitcast i32* %13 to i8*, !dbg !84
  call void @free(i8* %14) #7, !dbg !85
  ret void, !dbg !86
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_34_good() #0 !dbg !87 {
entry:
  call void @goodG2B(), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !90 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !96, metadata !DIExpression()), !dbg !97
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !98, metadata !DIExpression()), !dbg !99
  %call = call i64 @time(i64* null) #7, !dbg !100
  %conv = trunc i64 %call to i32, !dbg !101
  call void @srand(i32 %conv) #7, !dbg !102
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !103
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_34_good(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !106
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_34_bad(), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !108
  ret i32 0, !dbg !109
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !110 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_34_unionType, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_34_unionType* %myUnion, metadata !113, metadata !DIExpression()), !dbg !114
  store i32* null, i32** %data, align 8, !dbg !115
  %call = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !116
  %0 = bitcast i8* %call to i32*, !dbg !117
  store i32* %0, i32** %data, align 8, !dbg !118
  %1 = load i32*, i32** %data, align 8, !dbg !119
  %cmp = icmp eq i32* %1, null, !dbg !121
  br i1 %cmp, label %if.then, label %if.end, !dbg !122

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !123
  unreachable, !dbg !123

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !125
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_34_unionType* %myUnion to i32**, !dbg !126
  store i32* %2, i32** %unionFirst, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !128, metadata !DIExpression()), !dbg !130
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_34_unionType* %myUnion to i32**, !dbg !131
  %3 = load i32*, i32** %unionSecond, align 8, !dbg !131
  store i32* %3, i32** %data1, align 8, !dbg !130
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !132, metadata !DIExpression()), !dbg !134
  %4 = bitcast [11 x i32]* %source to i8*, !dbg !134
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !134
  call void @llvm.dbg.declare(metadata i64* %i, metadata !135, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !137, metadata !DIExpression()), !dbg !138
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !139
  %call2 = call i64 @wcslen(i32* %arraydecay) #9, !dbg !140
  store i64 %call2, i64* %sourceLen, align 8, !dbg !141
  store i64 0, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !144

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !145
  %6 = load i64, i64* %sourceLen, align 8, !dbg !147
  %add = add i64 %6, 1, !dbg !148
  %cmp3 = icmp ult i64 %5, %add, !dbg !149
  br i1 %cmp3, label %for.body, label %for.end, !dbg !150

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %7, !dbg !153
  %8 = load i32, i32* %arrayidx, align 4, !dbg !153
  %9 = load i32*, i32** %data1, align 8, !dbg !154
  %10 = load i64, i64* %i, align 8, !dbg !155
  %arrayidx4 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !154
  store i32 %8, i32* %arrayidx4, align 4, !dbg !156
  br label %for.inc, !dbg !157

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !158
  %inc = add i64 %11, 1, !dbg !158
  store i64 %inc, i64* %i, align 8, !dbg !158
  br label %for.cond, !dbg !159, !llvm.loop !160

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data1, align 8, !dbg !162
  call void @printWLine(i32* %12), !dbg !163
  %13 = load i32*, i32** %data1, align 8, !dbg !164
  %14 = bitcast i32* %13 to i8*, !dbg !164
  call void @free(i8* %14) #7, !dbg !165
  ret void, !dbg !166
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_34_bad", scope: !17, file: !17, line: 34, type: !18, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 36, type: !4)
!21 = !DILocation(line: 36, column: 15, scope: !16)
!22 = !DILocalVariable(name: "myUnion", scope: !16, file: !17, line: 37, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_34_unionType", file: !17, line: 30, baseType: !24)
!24 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !17, line: 26, size: 64, elements: !25)
!25 = !{!26, !27}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !24, file: !17, line: 28, baseType: !4, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !24, file: !17, line: 29, baseType: !4, size: 64)
!28 = !DILocation(line: 37, column: 75, scope: !16)
!29 = !DILocation(line: 38, column: 10, scope: !16)
!30 = !DILocation(line: 40, column: 23, scope: !16)
!31 = !DILocation(line: 40, column: 12, scope: !16)
!32 = !DILocation(line: 40, column: 10, scope: !16)
!33 = !DILocation(line: 41, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !16, file: !17, line: 41, column: 9)
!35 = !DILocation(line: 41, column: 14, scope: !34)
!36 = !DILocation(line: 41, column: 9, scope: !16)
!37 = !DILocation(line: 41, column: 24, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !17, line: 41, column: 23)
!39 = !DILocation(line: 42, column: 26, scope: !16)
!40 = !DILocation(line: 42, column: 13, scope: !16)
!41 = !DILocation(line: 42, column: 24, scope: !16)
!42 = !DILocalVariable(name: "data", scope: !43, file: !17, line: 44, type: !4)
!43 = distinct !DILexicalBlock(scope: !16, file: !17, line: 43, column: 5)
!44 = !DILocation(line: 44, column: 19, scope: !43)
!45 = !DILocation(line: 44, column: 34, scope: !43)
!46 = !DILocalVariable(name: "source", scope: !47, file: !17, line: 46, type: !48)
!47 = distinct !DILexicalBlock(scope: !43, file: !17, line: 45, column: 9)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 11)
!51 = !DILocation(line: 46, column: 21, scope: !47)
!52 = !DILocalVariable(name: "i", scope: !47, file: !17, line: 47, type: !53)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !54)
!54 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!55 = !DILocation(line: 47, column: 20, scope: !47)
!56 = !DILocalVariable(name: "sourceLen", scope: !47, file: !17, line: 47, type: !53)
!57 = !DILocation(line: 47, column: 23, scope: !47)
!58 = !DILocation(line: 48, column: 32, scope: !47)
!59 = !DILocation(line: 48, column: 25, scope: !47)
!60 = !DILocation(line: 48, column: 23, scope: !47)
!61 = !DILocation(line: 51, column: 20, scope: !62)
!62 = distinct !DILexicalBlock(scope: !47, file: !17, line: 51, column: 13)
!63 = !DILocation(line: 51, column: 18, scope: !62)
!64 = !DILocation(line: 51, column: 25, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !17, line: 51, column: 13)
!66 = !DILocation(line: 51, column: 29, scope: !65)
!67 = !DILocation(line: 51, column: 39, scope: !65)
!68 = !DILocation(line: 51, column: 27, scope: !65)
!69 = !DILocation(line: 51, column: 13, scope: !62)
!70 = !DILocation(line: 53, column: 34, scope: !71)
!71 = distinct !DILexicalBlock(scope: !65, file: !17, line: 52, column: 13)
!72 = !DILocation(line: 53, column: 27, scope: !71)
!73 = !DILocation(line: 53, column: 17, scope: !71)
!74 = !DILocation(line: 53, column: 22, scope: !71)
!75 = !DILocation(line: 53, column: 25, scope: !71)
!76 = !DILocation(line: 54, column: 13, scope: !71)
!77 = !DILocation(line: 51, column: 45, scope: !65)
!78 = !DILocation(line: 51, column: 13, scope: !65)
!79 = distinct !{!79, !69, !80, !81}
!80 = !DILocation(line: 54, column: 13, scope: !62)
!81 = !{!"llvm.loop.mustprogress"}
!82 = !DILocation(line: 55, column: 24, scope: !47)
!83 = !DILocation(line: 55, column: 13, scope: !47)
!84 = !DILocation(line: 56, column: 18, scope: !47)
!85 = !DILocation(line: 56, column: 13, scope: !47)
!86 = !DILocation(line: 59, column: 1, scope: !16)
!87 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_34_good", scope: !17, file: !17, line: 93, type: !18, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocation(line: 95, column: 5, scope: !87)
!89 = !DILocation(line: 96, column: 1, scope: !87)
!90 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 107, type: !91, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DISubroutineType(types: !92)
!92 = !{!7, !7, !93}
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!96 = !DILocalVariable(name: "argc", arg: 1, scope: !90, file: !17, line: 107, type: !7)
!97 = !DILocation(line: 107, column: 14, scope: !90)
!98 = !DILocalVariable(name: "argv", arg: 2, scope: !90, file: !17, line: 107, type: !93)
!99 = !DILocation(line: 107, column: 27, scope: !90)
!100 = !DILocation(line: 110, column: 22, scope: !90)
!101 = !DILocation(line: 110, column: 12, scope: !90)
!102 = !DILocation(line: 110, column: 5, scope: !90)
!103 = !DILocation(line: 112, column: 5, scope: !90)
!104 = !DILocation(line: 113, column: 5, scope: !90)
!105 = !DILocation(line: 114, column: 5, scope: !90)
!106 = !DILocation(line: 117, column: 5, scope: !90)
!107 = !DILocation(line: 118, column: 5, scope: !90)
!108 = !DILocation(line: 119, column: 5, scope: !90)
!109 = !DILocation(line: 121, column: 5, scope: !90)
!110 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 66, type: !18, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DILocalVariable(name: "data", scope: !110, file: !17, line: 68, type: !4)
!112 = !DILocation(line: 68, column: 15, scope: !110)
!113 = !DILocalVariable(name: "myUnion", scope: !110, file: !17, line: 69, type: !23)
!114 = !DILocation(line: 69, column: 75, scope: !110)
!115 = !DILocation(line: 70, column: 10, scope: !110)
!116 = !DILocation(line: 72, column: 23, scope: !110)
!117 = !DILocation(line: 72, column: 12, scope: !110)
!118 = !DILocation(line: 72, column: 10, scope: !110)
!119 = !DILocation(line: 73, column: 9, scope: !120)
!120 = distinct !DILexicalBlock(scope: !110, file: !17, line: 73, column: 9)
!121 = !DILocation(line: 73, column: 14, scope: !120)
!122 = !DILocation(line: 73, column: 9, scope: !110)
!123 = !DILocation(line: 73, column: 24, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !17, line: 73, column: 23)
!125 = !DILocation(line: 74, column: 26, scope: !110)
!126 = !DILocation(line: 74, column: 13, scope: !110)
!127 = !DILocation(line: 74, column: 24, scope: !110)
!128 = !DILocalVariable(name: "data", scope: !129, file: !17, line: 76, type: !4)
!129 = distinct !DILexicalBlock(scope: !110, file: !17, line: 75, column: 5)
!130 = !DILocation(line: 76, column: 19, scope: !129)
!131 = !DILocation(line: 76, column: 34, scope: !129)
!132 = !DILocalVariable(name: "source", scope: !133, file: !17, line: 78, type: !48)
!133 = distinct !DILexicalBlock(scope: !129, file: !17, line: 77, column: 9)
!134 = !DILocation(line: 78, column: 21, scope: !133)
!135 = !DILocalVariable(name: "i", scope: !133, file: !17, line: 79, type: !53)
!136 = !DILocation(line: 79, column: 20, scope: !133)
!137 = !DILocalVariable(name: "sourceLen", scope: !133, file: !17, line: 79, type: !53)
!138 = !DILocation(line: 79, column: 23, scope: !133)
!139 = !DILocation(line: 80, column: 32, scope: !133)
!140 = !DILocation(line: 80, column: 25, scope: !133)
!141 = !DILocation(line: 80, column: 23, scope: !133)
!142 = !DILocation(line: 83, column: 20, scope: !143)
!143 = distinct !DILexicalBlock(scope: !133, file: !17, line: 83, column: 13)
!144 = !DILocation(line: 83, column: 18, scope: !143)
!145 = !DILocation(line: 83, column: 25, scope: !146)
!146 = distinct !DILexicalBlock(scope: !143, file: !17, line: 83, column: 13)
!147 = !DILocation(line: 83, column: 29, scope: !146)
!148 = !DILocation(line: 83, column: 39, scope: !146)
!149 = !DILocation(line: 83, column: 27, scope: !146)
!150 = !DILocation(line: 83, column: 13, scope: !143)
!151 = !DILocation(line: 85, column: 34, scope: !152)
!152 = distinct !DILexicalBlock(scope: !146, file: !17, line: 84, column: 13)
!153 = !DILocation(line: 85, column: 27, scope: !152)
!154 = !DILocation(line: 85, column: 17, scope: !152)
!155 = !DILocation(line: 85, column: 22, scope: !152)
!156 = !DILocation(line: 85, column: 25, scope: !152)
!157 = !DILocation(line: 86, column: 13, scope: !152)
!158 = !DILocation(line: 83, column: 45, scope: !146)
!159 = !DILocation(line: 83, column: 13, scope: !146)
!160 = distinct !{!160, !150, !161, !81}
!161 = !DILocation(line: 86, column: 13, scope: !143)
!162 = !DILocation(line: 87, column: 24, scope: !133)
!163 = !DILocation(line: 87, column: 13, scope: !133)
!164 = !DILocation(line: 88, column: 18, scope: !133)
!165 = !DILocation(line: 88, column: 13, scope: !133)
!166 = !DILocation(line: 91, column: 1, scope: !110)
