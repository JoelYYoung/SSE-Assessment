; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_31.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_31_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_31_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !23
  %0 = bitcast i8* %call to i32*, !dbg !24
  store i32* %0, i32** %data, align 8, !dbg !25
  %1 = load i32*, i32** %data, align 8, !dbg !26
  %cmp = icmp eq i32* %1, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !32, metadata !DIExpression()), !dbg !34
  %2 = load i32*, i32** %data, align 8, !dbg !35
  store i32* %2, i32** %dataCopy, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !36, metadata !DIExpression()), !dbg !37
  %3 = load i32*, i32** %dataCopy, align 8, !dbg !38
  store i32* %3, i32** %data1, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %4 = bitcast [11 x i32]* %source to i8*, !dbg !44
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_31_bad.source to i8*), i64 44, i1 false), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !49, metadata !DIExpression()), !dbg !50
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !51
  %call2 = call i64 @wcslen(i32* %arraydecay) #9, !dbg !52
  store i64 %call2, i64* %sourceLen, align 8, !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !57
  %6 = load i64, i64* %sourceLen, align 8, !dbg !59
  %add = add i64 %6, 1, !dbg !60
  %cmp3 = icmp ult i64 %5, %add, !dbg !61
  br i1 %cmp3, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %7, !dbg !65
  %8 = load i32, i32* %arrayidx, align 4, !dbg !65
  %9 = load i32*, i32** %data1, align 8, !dbg !66
  %10 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx4 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !66
  store i32 %8, i32* %arrayidx4, align 4, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !70
  %inc = add i64 %11, 1, !dbg !70
  store i64 %inc, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data1, align 8, !dbg !75
  call void @printWLine(i32* %12), !dbg !76
  %13 = load i32*, i32** %data1, align 8, !dbg !77
  %14 = bitcast i32* %13 to i8*, !dbg !77
  call void @free(i8* %14) #7, !dbg !78
  ret void, !dbg !79
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_31_good() #0 !dbg !80 {
entry:
  call void @goodG2B(), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i64 @time(i64* null) #7, !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 %conv) #7, !dbg !95
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_31_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_31_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !103 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !104, metadata !DIExpression()), !dbg !105
  store i32* null, i32** %data, align 8, !dbg !106
  %call = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !107
  %0 = bitcast i8* %call to i32*, !dbg !108
  store i32* %0, i32** %data, align 8, !dbg !109
  %1 = load i32*, i32** %data, align 8, !dbg !110
  %cmp = icmp eq i32* %1, null, !dbg !112
  br i1 %cmp, label %if.then, label %if.end, !dbg !113

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !114
  unreachable, !dbg !114

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !116, metadata !DIExpression()), !dbg !118
  %2 = load i32*, i32** %data, align 8, !dbg !119
  store i32* %2, i32** %dataCopy, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !120, metadata !DIExpression()), !dbg !121
  %3 = load i32*, i32** %dataCopy, align 8, !dbg !122
  store i32* %3, i32** %data1, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !123, metadata !DIExpression()), !dbg !125
  %4 = bitcast [11 x i32]* %source to i8*, !dbg !125
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !125
  call void @llvm.dbg.declare(metadata i64* %i, metadata !126, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !128, metadata !DIExpression()), !dbg !129
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !130
  %call2 = call i64 @wcslen(i32* %arraydecay) #9, !dbg !131
  store i64 %call2, i64* %sourceLen, align 8, !dbg !132
  store i64 0, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !135

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !136
  %6 = load i64, i64* %sourceLen, align 8, !dbg !138
  %add = add i64 %6, 1, !dbg !139
  %cmp3 = icmp ult i64 %5, %add, !dbg !140
  br i1 %cmp3, label %for.body, label %for.end, !dbg !141

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %7, !dbg !144
  %8 = load i32, i32* %arrayidx, align 4, !dbg !144
  %9 = load i32*, i32** %data1, align 8, !dbg !145
  %10 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx4 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !145
  store i32 %8, i32* %arrayidx4, align 4, !dbg !147
  br label %for.inc, !dbg !148

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !149
  %inc = add i64 %11, 1, !dbg !149
  store i64 %inc, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !150, !llvm.loop !151

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data1, align 8, !dbg !153
  call void @printWLine(i32* %12), !dbg !154
  %13 = load i32*, i32** %data1, align 8, !dbg !155
  %14 = bitcast i32* %13 to i8*, !dbg !155
  call void @free(i8* %14) #7, !dbg !156
  ret void, !dbg !157
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_31_bad", scope: !17, file: !17, line: 28, type: !18, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 30, type: !4)
!21 = !DILocation(line: 30, column: 15, scope: !16)
!22 = !DILocation(line: 31, column: 10, scope: !16)
!23 = !DILocation(line: 33, column: 23, scope: !16)
!24 = !DILocation(line: 33, column: 12, scope: !16)
!25 = !DILocation(line: 33, column: 10, scope: !16)
!26 = !DILocation(line: 34, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !16, file: !17, line: 34, column: 9)
!28 = !DILocation(line: 34, column: 14, scope: !27)
!29 = !DILocation(line: 34, column: 9, scope: !16)
!30 = !DILocation(line: 34, column: 24, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !17, line: 34, column: 23)
!32 = !DILocalVariable(name: "dataCopy", scope: !33, file: !17, line: 36, type: !4)
!33 = distinct !DILexicalBlock(scope: !16, file: !17, line: 35, column: 5)
!34 = !DILocation(line: 36, column: 19, scope: !33)
!35 = !DILocation(line: 36, column: 30, scope: !33)
!36 = !DILocalVariable(name: "data", scope: !33, file: !17, line: 37, type: !4)
!37 = !DILocation(line: 37, column: 19, scope: !33)
!38 = !DILocation(line: 37, column: 26, scope: !33)
!39 = !DILocalVariable(name: "source", scope: !40, file: !17, line: 39, type: !41)
!40 = distinct !DILexicalBlock(scope: !33, file: !17, line: 38, column: 9)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 11)
!44 = !DILocation(line: 39, column: 21, scope: !40)
!45 = !DILocalVariable(name: "i", scope: !40, file: !17, line: 40, type: !46)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !47)
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 40, column: 20, scope: !40)
!49 = !DILocalVariable(name: "sourceLen", scope: !40, file: !17, line: 40, type: !46)
!50 = !DILocation(line: 40, column: 23, scope: !40)
!51 = !DILocation(line: 41, column: 32, scope: !40)
!52 = !DILocation(line: 41, column: 25, scope: !40)
!53 = !DILocation(line: 41, column: 23, scope: !40)
!54 = !DILocation(line: 44, column: 20, scope: !55)
!55 = distinct !DILexicalBlock(scope: !40, file: !17, line: 44, column: 13)
!56 = !DILocation(line: 44, column: 18, scope: !55)
!57 = !DILocation(line: 44, column: 25, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !17, line: 44, column: 13)
!59 = !DILocation(line: 44, column: 29, scope: !58)
!60 = !DILocation(line: 44, column: 39, scope: !58)
!61 = !DILocation(line: 44, column: 27, scope: !58)
!62 = !DILocation(line: 44, column: 13, scope: !55)
!63 = !DILocation(line: 46, column: 34, scope: !64)
!64 = distinct !DILexicalBlock(scope: !58, file: !17, line: 45, column: 13)
!65 = !DILocation(line: 46, column: 27, scope: !64)
!66 = !DILocation(line: 46, column: 17, scope: !64)
!67 = !DILocation(line: 46, column: 22, scope: !64)
!68 = !DILocation(line: 46, column: 25, scope: !64)
!69 = !DILocation(line: 47, column: 13, scope: !64)
!70 = !DILocation(line: 44, column: 45, scope: !58)
!71 = !DILocation(line: 44, column: 13, scope: !58)
!72 = distinct !{!72, !62, !73, !74}
!73 = !DILocation(line: 47, column: 13, scope: !55)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocation(line: 48, column: 24, scope: !40)
!76 = !DILocation(line: 48, column: 13, scope: !40)
!77 = !DILocation(line: 49, column: 18, scope: !40)
!78 = !DILocation(line: 49, column: 13, scope: !40)
!79 = !DILocation(line: 52, column: 1, scope: !16)
!80 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_31_good", scope: !17, file: !17, line: 85, type: !18, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocation(line: 87, column: 5, scope: !80)
!82 = !DILocation(line: 88, column: 1, scope: !80)
!83 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 99, type: !84, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!7, !7, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !17, line: 99, type: !7)
!90 = !DILocation(line: 99, column: 14, scope: !83)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !17, line: 99, type: !86)
!92 = !DILocation(line: 99, column: 27, scope: !83)
!93 = !DILocation(line: 102, column: 22, scope: !83)
!94 = !DILocation(line: 102, column: 12, scope: !83)
!95 = !DILocation(line: 102, column: 5, scope: !83)
!96 = !DILocation(line: 104, column: 5, scope: !83)
!97 = !DILocation(line: 105, column: 5, scope: !83)
!98 = !DILocation(line: 106, column: 5, scope: !83)
!99 = !DILocation(line: 109, column: 5, scope: !83)
!100 = !DILocation(line: 110, column: 5, scope: !83)
!101 = !DILocation(line: 111, column: 5, scope: !83)
!102 = !DILocation(line: 113, column: 5, scope: !83)
!103 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 59, type: !18, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !17, line: 61, type: !4)
!105 = !DILocation(line: 61, column: 15, scope: !103)
!106 = !DILocation(line: 62, column: 10, scope: !103)
!107 = !DILocation(line: 64, column: 23, scope: !103)
!108 = !DILocation(line: 64, column: 12, scope: !103)
!109 = !DILocation(line: 64, column: 10, scope: !103)
!110 = !DILocation(line: 65, column: 9, scope: !111)
!111 = distinct !DILexicalBlock(scope: !103, file: !17, line: 65, column: 9)
!112 = !DILocation(line: 65, column: 14, scope: !111)
!113 = !DILocation(line: 65, column: 9, scope: !103)
!114 = !DILocation(line: 65, column: 24, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !17, line: 65, column: 23)
!116 = !DILocalVariable(name: "dataCopy", scope: !117, file: !17, line: 67, type: !4)
!117 = distinct !DILexicalBlock(scope: !103, file: !17, line: 66, column: 5)
!118 = !DILocation(line: 67, column: 19, scope: !117)
!119 = !DILocation(line: 67, column: 30, scope: !117)
!120 = !DILocalVariable(name: "data", scope: !117, file: !17, line: 68, type: !4)
!121 = !DILocation(line: 68, column: 19, scope: !117)
!122 = !DILocation(line: 68, column: 26, scope: !117)
!123 = !DILocalVariable(name: "source", scope: !124, file: !17, line: 70, type: !41)
!124 = distinct !DILexicalBlock(scope: !117, file: !17, line: 69, column: 9)
!125 = !DILocation(line: 70, column: 21, scope: !124)
!126 = !DILocalVariable(name: "i", scope: !124, file: !17, line: 71, type: !46)
!127 = !DILocation(line: 71, column: 20, scope: !124)
!128 = !DILocalVariable(name: "sourceLen", scope: !124, file: !17, line: 71, type: !46)
!129 = !DILocation(line: 71, column: 23, scope: !124)
!130 = !DILocation(line: 72, column: 32, scope: !124)
!131 = !DILocation(line: 72, column: 25, scope: !124)
!132 = !DILocation(line: 72, column: 23, scope: !124)
!133 = !DILocation(line: 75, column: 20, scope: !134)
!134 = distinct !DILexicalBlock(scope: !124, file: !17, line: 75, column: 13)
!135 = !DILocation(line: 75, column: 18, scope: !134)
!136 = !DILocation(line: 75, column: 25, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !17, line: 75, column: 13)
!138 = !DILocation(line: 75, column: 29, scope: !137)
!139 = !DILocation(line: 75, column: 39, scope: !137)
!140 = !DILocation(line: 75, column: 27, scope: !137)
!141 = !DILocation(line: 75, column: 13, scope: !134)
!142 = !DILocation(line: 77, column: 34, scope: !143)
!143 = distinct !DILexicalBlock(scope: !137, file: !17, line: 76, column: 13)
!144 = !DILocation(line: 77, column: 27, scope: !143)
!145 = !DILocation(line: 77, column: 17, scope: !143)
!146 = !DILocation(line: 77, column: 22, scope: !143)
!147 = !DILocation(line: 77, column: 25, scope: !143)
!148 = !DILocation(line: 78, column: 13, scope: !143)
!149 = !DILocation(line: 75, column: 45, scope: !137)
!150 = !DILocation(line: 75, column: 13, scope: !137)
!151 = distinct !{!151, !141, !152, !74}
!152 = !DILocation(line: 78, column: 13, scope: !134)
!153 = !DILocation(line: 79, column: 24, scope: !124)
!154 = !DILocation(line: 79, column: 13, scope: !124)
!155 = !DILocation(line: 80, column: 18, scope: !124)
!156 = !DILocation(line: 80, column: 13, scope: !124)
!157 = !DILocation(line: 83, column: 1, scope: !103)
