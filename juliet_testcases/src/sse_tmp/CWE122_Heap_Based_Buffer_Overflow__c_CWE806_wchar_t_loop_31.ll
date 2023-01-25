; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_31.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_31_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !22
  %0 = bitcast i8* %call to i32*, !dbg !23
  store i32* %0, i32** %data, align 8, !dbg !24
  %1 = load i32*, i32** %data, align 8, !dbg !25
  %cmp = icmp eq i32* %1, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !31
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #7, !dbg !32
  %3 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !35, metadata !DIExpression()), !dbg !37
  %4 = load i32*, i32** %data, align 8, !dbg !38
  store i32* %4, i32** %dataCopy, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !39, metadata !DIExpression()), !dbg !40
  %5 = load i32*, i32** %dataCopy, align 8, !dbg !41
  store i32* %5, i32** %data2, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !42, metadata !DIExpression()), !dbg !47
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %i, metadata !48, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !52, metadata !DIExpression()), !dbg !53
  %7 = load i32*, i32** %data2, align 8, !dbg !54
  %call3 = call i64 @wcslen(i32* %7) #9, !dbg !55
  store i64 %call3, i64* %dataLen, align 8, !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !60
  %9 = load i64, i64* %dataLen, align 8, !dbg !62
  %cmp4 = icmp ult i64 %8, %9, !dbg !63
  br i1 %cmp4, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %10 = load i32*, i32** %data2, align 8, !dbg !65
  %11 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx5 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !65
  %12 = load i32, i32* %arrayidx5, align 4, !dbg !65
  %13 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %13, !dbg !69
  store i32 %12, i32* %arrayidx6, align 4, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %14, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !77
  store i32 0, i32* %arrayidx7, align 4, !dbg !78
  %15 = load i32*, i32** %data2, align 8, !dbg !79
  call void @printWLine(i32* %15), !dbg !80
  %16 = load i32*, i32** %data2, align 8, !dbg !81
  %17 = bitcast i32* %16 to i8*, !dbg !81
  call void @free(i8* %17) #7, !dbg !82
  ret void, !dbg !83
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_31_good() #0 !dbg !84 {
entry:
  call void @goodG2B(), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !87 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !93, metadata !DIExpression()), !dbg !94
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !95, metadata !DIExpression()), !dbg !96
  %call = call i64 @time(i64* null) #7, !dbg !97
  %conv = trunc i64 %call to i32, !dbg !98
  call void @srand(i32 %conv) #7, !dbg !99
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !100
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_31_good(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !103
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_31_bad(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !105
  ret i32 0, !dbg !106
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !107 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !108, metadata !DIExpression()), !dbg !109
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !110
  %0 = bitcast i8* %call to i32*, !dbg !111
  store i32* %0, i32** %data, align 8, !dbg !112
  %1 = load i32*, i32** %data, align 8, !dbg !113
  %cmp = icmp eq i32* %1, null, !dbg !115
  br i1 %cmp, label %if.then, label %if.end, !dbg !116

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !117
  unreachable, !dbg !117

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !119
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !120
  %3 = load i32*, i32** %data, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !121
  store i32 0, i32* %arrayidx, align 4, !dbg !122
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !123, metadata !DIExpression()), !dbg !125
  %4 = load i32*, i32** %data, align 8, !dbg !126
  store i32* %4, i32** %dataCopy, align 8, !dbg !125
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !127, metadata !DIExpression()), !dbg !128
  %5 = load i32*, i32** %dataCopy, align 8, !dbg !129
  store i32* %5, i32** %data2, align 8, !dbg !128
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !130, metadata !DIExpression()), !dbg !132
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !132
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !132
  call void @llvm.dbg.declare(metadata i64* %i, metadata !133, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !135, metadata !DIExpression()), !dbg !136
  %7 = load i32*, i32** %data2, align 8, !dbg !137
  %call3 = call i64 @wcslen(i32* %7) #9, !dbg !138
  store i64 %call3, i64* %dataLen, align 8, !dbg !139
  store i64 0, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !142

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !143
  %9 = load i64, i64* %dataLen, align 8, !dbg !145
  %cmp4 = icmp ult i64 %8, %9, !dbg !146
  br i1 %cmp4, label %for.body, label %for.end, !dbg !147

for.body:                                         ; preds = %for.cond
  %10 = load i32*, i32** %data2, align 8, !dbg !148
  %11 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx5 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !148
  %12 = load i32, i32* %arrayidx5, align 4, !dbg !148
  %13 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %13, !dbg !152
  store i32 %12, i32* %arrayidx6, align 4, !dbg !153
  br label %for.inc, !dbg !154

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !155
  %inc = add i64 %14, 1, !dbg !155
  store i64 %inc, i64* %i, align 8, !dbg !155
  br label %for.cond, !dbg !156, !llvm.loop !157

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !159
  store i32 0, i32* %arrayidx7, align 4, !dbg !160
  %15 = load i32*, i32** %data2, align 8, !dbg !161
  call void @printWLine(i32* %15), !dbg !162
  %16 = load i32*, i32** %data2, align 8, !dbg !163
  %17 = bitcast i32* %16 to i8*, !dbg !163
  call void @free(i8* %17) #7, !dbg !164
  ret void, !dbg !165
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_31_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 23, scope: !16)
!23 = !DILocation(line: 26, column: 12, scope: !16)
!24 = !DILocation(line: 26, column: 10, scope: !16)
!25 = !DILocation(line: 27, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 9)
!27 = !DILocation(line: 27, column: 14, scope: !26)
!28 = !DILocation(line: 27, column: 9, scope: !16)
!29 = !DILocation(line: 27, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !17, line: 27, column: 23)
!31 = !DILocation(line: 29, column: 13, scope: !16)
!32 = !DILocation(line: 29, column: 5, scope: !16)
!33 = !DILocation(line: 30, column: 5, scope: !16)
!34 = !DILocation(line: 30, column: 17, scope: !16)
!35 = !DILocalVariable(name: "dataCopy", scope: !36, file: !17, line: 32, type: !4)
!36 = distinct !DILexicalBlock(scope: !16, file: !17, line: 31, column: 5)
!37 = !DILocation(line: 32, column: 19, scope: !36)
!38 = !DILocation(line: 32, column: 30, scope: !36)
!39 = !DILocalVariable(name: "data", scope: !36, file: !17, line: 33, type: !4)
!40 = !DILocation(line: 33, column: 19, scope: !36)
!41 = !DILocation(line: 33, column: 26, scope: !36)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !17, line: 35, type: !44)
!43 = distinct !DILexicalBlock(scope: !36, file: !17, line: 34, column: 9)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 50)
!47 = !DILocation(line: 35, column: 21, scope: !43)
!48 = !DILocalVariable(name: "i", scope: !43, file: !17, line: 36, type: !49)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !50)
!50 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 36, column: 20, scope: !43)
!52 = !DILocalVariable(name: "dataLen", scope: !43, file: !17, line: 36, type: !49)
!53 = !DILocation(line: 36, column: 23, scope: !43)
!54 = !DILocation(line: 37, column: 30, scope: !43)
!55 = !DILocation(line: 37, column: 23, scope: !43)
!56 = !DILocation(line: 37, column: 21, scope: !43)
!57 = !DILocation(line: 39, column: 20, scope: !58)
!58 = distinct !DILexicalBlock(scope: !43, file: !17, line: 39, column: 13)
!59 = !DILocation(line: 39, column: 18, scope: !58)
!60 = !DILocation(line: 39, column: 25, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !17, line: 39, column: 13)
!62 = !DILocation(line: 39, column: 29, scope: !61)
!63 = !DILocation(line: 39, column: 27, scope: !61)
!64 = !DILocation(line: 39, column: 13, scope: !58)
!65 = !DILocation(line: 41, column: 27, scope: !66)
!66 = distinct !DILexicalBlock(scope: !61, file: !17, line: 40, column: 13)
!67 = !DILocation(line: 41, column: 32, scope: !66)
!68 = !DILocation(line: 41, column: 22, scope: !66)
!69 = !DILocation(line: 41, column: 17, scope: !66)
!70 = !DILocation(line: 41, column: 25, scope: !66)
!71 = !DILocation(line: 42, column: 13, scope: !66)
!72 = !DILocation(line: 39, column: 39, scope: !61)
!73 = !DILocation(line: 39, column: 13, scope: !61)
!74 = distinct !{!74, !64, !75, !76}
!75 = !DILocation(line: 42, column: 13, scope: !58)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 43, column: 13, scope: !43)
!78 = !DILocation(line: 43, column: 24, scope: !43)
!79 = !DILocation(line: 44, column: 24, scope: !43)
!80 = !DILocation(line: 44, column: 13, scope: !43)
!81 = !DILocation(line: 45, column: 18, scope: !43)
!82 = !DILocation(line: 45, column: 13, scope: !43)
!83 = !DILocation(line: 48, column: 1, scope: !16)
!84 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_31_good", scope: !17, file: !17, line: 82, type: !18, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocation(line: 84, column: 5, scope: !84)
!86 = !DILocation(line: 85, column: 1, scope: !84)
!87 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 96, type: !88, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DISubroutineType(types: !89)
!89 = !{!7, !7, !90}
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!93 = !DILocalVariable(name: "argc", arg: 1, scope: !87, file: !17, line: 96, type: !7)
!94 = !DILocation(line: 96, column: 14, scope: !87)
!95 = !DILocalVariable(name: "argv", arg: 2, scope: !87, file: !17, line: 96, type: !90)
!96 = !DILocation(line: 96, column: 27, scope: !87)
!97 = !DILocation(line: 99, column: 22, scope: !87)
!98 = !DILocation(line: 99, column: 12, scope: !87)
!99 = !DILocation(line: 99, column: 5, scope: !87)
!100 = !DILocation(line: 101, column: 5, scope: !87)
!101 = !DILocation(line: 102, column: 5, scope: !87)
!102 = !DILocation(line: 103, column: 5, scope: !87)
!103 = !DILocation(line: 106, column: 5, scope: !87)
!104 = !DILocation(line: 107, column: 5, scope: !87)
!105 = !DILocation(line: 108, column: 5, scope: !87)
!106 = !DILocation(line: 110, column: 5, scope: !87)
!107 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 55, type: !18, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !17, line: 57, type: !4)
!109 = !DILocation(line: 57, column: 15, scope: !107)
!110 = !DILocation(line: 58, column: 23, scope: !107)
!111 = !DILocation(line: 58, column: 12, scope: !107)
!112 = !DILocation(line: 58, column: 10, scope: !107)
!113 = !DILocation(line: 59, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !107, file: !17, line: 59, column: 9)
!115 = !DILocation(line: 59, column: 14, scope: !114)
!116 = !DILocation(line: 59, column: 9, scope: !107)
!117 = !DILocation(line: 59, column: 24, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !17, line: 59, column: 23)
!119 = !DILocation(line: 61, column: 13, scope: !107)
!120 = !DILocation(line: 61, column: 5, scope: !107)
!121 = !DILocation(line: 62, column: 5, scope: !107)
!122 = !DILocation(line: 62, column: 16, scope: !107)
!123 = !DILocalVariable(name: "dataCopy", scope: !124, file: !17, line: 64, type: !4)
!124 = distinct !DILexicalBlock(scope: !107, file: !17, line: 63, column: 5)
!125 = !DILocation(line: 64, column: 19, scope: !124)
!126 = !DILocation(line: 64, column: 30, scope: !124)
!127 = !DILocalVariable(name: "data", scope: !124, file: !17, line: 65, type: !4)
!128 = !DILocation(line: 65, column: 19, scope: !124)
!129 = !DILocation(line: 65, column: 26, scope: !124)
!130 = !DILocalVariable(name: "dest", scope: !131, file: !17, line: 67, type: !44)
!131 = distinct !DILexicalBlock(scope: !124, file: !17, line: 66, column: 9)
!132 = !DILocation(line: 67, column: 21, scope: !131)
!133 = !DILocalVariable(name: "i", scope: !131, file: !17, line: 68, type: !49)
!134 = !DILocation(line: 68, column: 20, scope: !131)
!135 = !DILocalVariable(name: "dataLen", scope: !131, file: !17, line: 68, type: !49)
!136 = !DILocation(line: 68, column: 23, scope: !131)
!137 = !DILocation(line: 69, column: 30, scope: !131)
!138 = !DILocation(line: 69, column: 23, scope: !131)
!139 = !DILocation(line: 69, column: 21, scope: !131)
!140 = !DILocation(line: 71, column: 20, scope: !141)
!141 = distinct !DILexicalBlock(scope: !131, file: !17, line: 71, column: 13)
!142 = !DILocation(line: 71, column: 18, scope: !141)
!143 = !DILocation(line: 71, column: 25, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !17, line: 71, column: 13)
!145 = !DILocation(line: 71, column: 29, scope: !144)
!146 = !DILocation(line: 71, column: 27, scope: !144)
!147 = !DILocation(line: 71, column: 13, scope: !141)
!148 = !DILocation(line: 73, column: 27, scope: !149)
!149 = distinct !DILexicalBlock(scope: !144, file: !17, line: 72, column: 13)
!150 = !DILocation(line: 73, column: 32, scope: !149)
!151 = !DILocation(line: 73, column: 22, scope: !149)
!152 = !DILocation(line: 73, column: 17, scope: !149)
!153 = !DILocation(line: 73, column: 25, scope: !149)
!154 = !DILocation(line: 74, column: 13, scope: !149)
!155 = !DILocation(line: 71, column: 39, scope: !144)
!156 = !DILocation(line: 71, column: 13, scope: !144)
!157 = distinct !{!157, !147, !158, !76}
!158 = !DILocation(line: 74, column: 13, scope: !141)
!159 = !DILocation(line: 75, column: 13, scope: !131)
!160 = !DILocation(line: 75, column: 24, scope: !131)
!161 = !DILocation(line: 76, column: 24, scope: !131)
!162 = !DILocation(line: 76, column: 13, scope: !131)
!163 = !DILocation(line: 77, column: 18, scope: !131)
!164 = !DILocation(line: 77, column: 13, scope: !131)
!165 = !DILocation(line: 80, column: 1, scope: !107)
