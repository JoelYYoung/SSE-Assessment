; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_44.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_44_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !22, metadata !DIExpression()), !dbg !26
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !27
  %0 = bitcast i8* %call to i32*, !dbg !28
  store i32* %0, i32** %data, align 8, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !36
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #7, !dbg !37
  %3 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %4 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !40
  %5 = load i32*, i32** %data, align 8, !dbg !41
  call void %4(i32* %5), !dbg !40
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32* %data) #0 !dbg !43 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !46, metadata !DIExpression()), !dbg !51
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %i, metadata !52, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !56, metadata !DIExpression()), !dbg !57
  %1 = load i32*, i32** %data.addr, align 8, !dbg !58
  %call = call i64 @wcslen(i32* %1) #9, !dbg !59
  store i64 %call, i64* %dataLen, align 8, !dbg !60
  store i64 0, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !63

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !64
  %3 = load i64, i64* %dataLen, align 8, !dbg !66
  %cmp = icmp ult i64 %2, %3, !dbg !67
  br i1 %cmp, label %for.body, label %for.end, !dbg !68

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %data.addr, align 8, !dbg !69
  %5 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !69
  %6 = load i32, i32* %arrayidx, align 4, !dbg !69
  %7 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %7, !dbg !73
  store i32 %6, i32* %arrayidx1, align 4, !dbg !74
  br label %for.inc, !dbg !75

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !76
  %inc = add i64 %8, 1, !dbg !76
  store i64 %inc, i64* %i, align 8, !dbg !76
  br label %for.cond, !dbg !77, !llvm.loop !78

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !81
  store i32 0, i32* %arrayidx2, align 4, !dbg !82
  %9 = load i32*, i32** %data.addr, align 8, !dbg !83
  call void @printWLine(i32* %9), !dbg !84
  %10 = load i32*, i32** %data.addr, align 8, !dbg !85
  %11 = bitcast i32* %10 to i8*, !dbg !85
  call void @free(i8* %11) #7, !dbg !86
  ret void, !dbg !87
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_44_good() #0 !dbg !88 {
entry:
  call void @goodG2B(), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !91 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !97, metadata !DIExpression()), !dbg !98
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !99, metadata !DIExpression()), !dbg !100
  %call = call i64 @time(i64* null) #7, !dbg !101
  %conv = trunc i64 %call to i32, !dbg !102
  call void @srand(i32 %conv) #7, !dbg !103
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !104
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_44_good(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !107
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_44_bad(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !109
  ret i32 0, !dbg !110
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #6

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !111 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !114, metadata !DIExpression()), !dbg !115
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !115
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !116
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
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !126
  %3 = load i32*, i32** %data, align 8, !dbg !127
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !127
  store i32 0, i32* %arrayidx, align 4, !dbg !128
  %4 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !129
  %5 = load i32*, i32** %data, align 8, !dbg !130
  call void %4(i32* %5), !dbg !129
  ret void, !dbg !131
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !132 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !133, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !135, metadata !DIExpression()), !dbg !137
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !137
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !137
  call void @llvm.dbg.declare(metadata i64* %i, metadata !138, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !140, metadata !DIExpression()), !dbg !141
  %1 = load i32*, i32** %data.addr, align 8, !dbg !142
  %call = call i64 @wcslen(i32* %1) #9, !dbg !143
  store i64 %call, i64* %dataLen, align 8, !dbg !144
  store i64 0, i64* %i, align 8, !dbg !145
  br label %for.cond, !dbg !147

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !148
  %3 = load i64, i64* %dataLen, align 8, !dbg !150
  %cmp = icmp ult i64 %2, %3, !dbg !151
  br i1 %cmp, label %for.body, label %for.end, !dbg !152

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %data.addr, align 8, !dbg !153
  %5 = load i64, i64* %i, align 8, !dbg !155
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !153
  %6 = load i32, i32* %arrayidx, align 4, !dbg !153
  %7 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %7, !dbg !157
  store i32 %6, i32* %arrayidx1, align 4, !dbg !158
  br label %for.inc, !dbg !159

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !160
  %inc = add i64 %8, 1, !dbg !160
  store i64 %inc, i64* %i, align 8, !dbg !160
  br label %for.cond, !dbg !161, !llvm.loop !162

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !164
  store i32 0, i32* %arrayidx2, align 4, !dbg !165
  %9 = load i32*, i32** %data.addr, align 8, !dbg !166
  call void @printWLine(i32* %9), !dbg !167
  %10 = load i32*, i32** %data.addr, align 8, !dbg !168
  %11 = bitcast i32* %10 to i8*, !dbg !168
  call void @free(i8* %11) #7, !dbg !169
  ret void, !dbg !170
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_44.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_44_bad", scope: !17, file: !17, line: 40, type: !18, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_44.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 42, type: !4)
!21 = !DILocation(line: 42, column: 15, scope: !16)
!22 = !DILocalVariable(name: "funcPtr", scope: !16, file: !17, line: 44, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DISubroutineType(types: !25)
!25 = !{null, !4}
!26 = !DILocation(line: 44, column: 12, scope: !16)
!27 = !DILocation(line: 45, column: 23, scope: !16)
!28 = !DILocation(line: 45, column: 12, scope: !16)
!29 = !DILocation(line: 45, column: 10, scope: !16)
!30 = !DILocation(line: 46, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !16, file: !17, line: 46, column: 9)
!32 = !DILocation(line: 46, column: 14, scope: !31)
!33 = !DILocation(line: 46, column: 9, scope: !16)
!34 = !DILocation(line: 46, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !17, line: 46, column: 23)
!36 = !DILocation(line: 48, column: 13, scope: !16)
!37 = !DILocation(line: 48, column: 5, scope: !16)
!38 = !DILocation(line: 49, column: 5, scope: !16)
!39 = !DILocation(line: 49, column: 17, scope: !16)
!40 = !DILocation(line: 51, column: 5, scope: !16)
!41 = !DILocation(line: 51, column: 13, scope: !16)
!42 = !DILocation(line: 52, column: 1, scope: !16)
!43 = distinct !DISubprogram(name: "badSink", scope: !17, file: !17, line: 23, type: !24, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocalVariable(name: "data", arg: 1, scope: !43, file: !17, line: 23, type: !4)
!45 = !DILocation(line: 23, column: 31, scope: !43)
!46 = !DILocalVariable(name: "dest", scope: !47, file: !17, line: 26, type: !48)
!47 = distinct !DILexicalBlock(scope: !43, file: !17, line: 25, column: 5)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 50)
!51 = !DILocation(line: 26, column: 17, scope: !47)
!52 = !DILocalVariable(name: "i", scope: !47, file: !17, line: 27, type: !53)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !54)
!54 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!55 = !DILocation(line: 27, column: 16, scope: !47)
!56 = !DILocalVariable(name: "dataLen", scope: !47, file: !17, line: 27, type: !53)
!57 = !DILocation(line: 27, column: 19, scope: !47)
!58 = !DILocation(line: 28, column: 26, scope: !47)
!59 = !DILocation(line: 28, column: 19, scope: !47)
!60 = !DILocation(line: 28, column: 17, scope: !47)
!61 = !DILocation(line: 30, column: 16, scope: !62)
!62 = distinct !DILexicalBlock(scope: !47, file: !17, line: 30, column: 9)
!63 = !DILocation(line: 30, column: 14, scope: !62)
!64 = !DILocation(line: 30, column: 21, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !17, line: 30, column: 9)
!66 = !DILocation(line: 30, column: 25, scope: !65)
!67 = !DILocation(line: 30, column: 23, scope: !65)
!68 = !DILocation(line: 30, column: 9, scope: !62)
!69 = !DILocation(line: 32, column: 23, scope: !70)
!70 = distinct !DILexicalBlock(scope: !65, file: !17, line: 31, column: 9)
!71 = !DILocation(line: 32, column: 28, scope: !70)
!72 = !DILocation(line: 32, column: 18, scope: !70)
!73 = !DILocation(line: 32, column: 13, scope: !70)
!74 = !DILocation(line: 32, column: 21, scope: !70)
!75 = !DILocation(line: 33, column: 9, scope: !70)
!76 = !DILocation(line: 30, column: 35, scope: !65)
!77 = !DILocation(line: 30, column: 9, scope: !65)
!78 = distinct !{!78, !68, !79, !80}
!79 = !DILocation(line: 33, column: 9, scope: !62)
!80 = !{!"llvm.loop.mustprogress"}
!81 = !DILocation(line: 34, column: 9, scope: !47)
!82 = !DILocation(line: 34, column: 20, scope: !47)
!83 = !DILocation(line: 35, column: 20, scope: !47)
!84 = !DILocation(line: 35, column: 9, scope: !47)
!85 = !DILocation(line: 36, column: 14, scope: !47)
!86 = !DILocation(line: 36, column: 9, scope: !47)
!87 = !DILocation(line: 38, column: 1, scope: !43)
!88 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_44_good", scope: !17, file: !17, line: 88, type: !18, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocation(line: 90, column: 5, scope: !88)
!90 = !DILocation(line: 91, column: 1, scope: !88)
!91 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 102, type: !92, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DISubroutineType(types: !93)
!93 = !{!7, !7, !94}
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!97 = !DILocalVariable(name: "argc", arg: 1, scope: !91, file: !17, line: 102, type: !7)
!98 = !DILocation(line: 102, column: 14, scope: !91)
!99 = !DILocalVariable(name: "argv", arg: 2, scope: !91, file: !17, line: 102, type: !94)
!100 = !DILocation(line: 102, column: 27, scope: !91)
!101 = !DILocation(line: 105, column: 22, scope: !91)
!102 = !DILocation(line: 105, column: 12, scope: !91)
!103 = !DILocation(line: 105, column: 5, scope: !91)
!104 = !DILocation(line: 107, column: 5, scope: !91)
!105 = !DILocation(line: 108, column: 5, scope: !91)
!106 = !DILocation(line: 109, column: 5, scope: !91)
!107 = !DILocation(line: 112, column: 5, scope: !91)
!108 = !DILocation(line: 113, column: 5, scope: !91)
!109 = !DILocation(line: 114, column: 5, scope: !91)
!110 = !DILocation(line: 116, column: 5, scope: !91)
!111 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 76, type: !18, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "data", scope: !111, file: !17, line: 78, type: !4)
!113 = !DILocation(line: 78, column: 15, scope: !111)
!114 = !DILocalVariable(name: "funcPtr", scope: !111, file: !17, line: 79, type: !23)
!115 = !DILocation(line: 79, column: 12, scope: !111)
!116 = !DILocation(line: 80, column: 23, scope: !111)
!117 = !DILocation(line: 80, column: 12, scope: !111)
!118 = !DILocation(line: 80, column: 10, scope: !111)
!119 = !DILocation(line: 81, column: 9, scope: !120)
!120 = distinct !DILexicalBlock(scope: !111, file: !17, line: 81, column: 9)
!121 = !DILocation(line: 81, column: 14, scope: !120)
!122 = !DILocation(line: 81, column: 9, scope: !111)
!123 = !DILocation(line: 81, column: 24, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !17, line: 81, column: 23)
!125 = !DILocation(line: 83, column: 13, scope: !111)
!126 = !DILocation(line: 83, column: 5, scope: !111)
!127 = !DILocation(line: 84, column: 5, scope: !111)
!128 = !DILocation(line: 84, column: 16, scope: !111)
!129 = !DILocation(line: 85, column: 5, scope: !111)
!130 = !DILocation(line: 85, column: 13, scope: !111)
!131 = !DILocation(line: 86, column: 1, scope: !111)
!132 = distinct !DISubprogram(name: "goodG2BSink", scope: !17, file: !17, line: 59, type: !24, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!133 = !DILocalVariable(name: "data", arg: 1, scope: !132, file: !17, line: 59, type: !4)
!134 = !DILocation(line: 59, column: 35, scope: !132)
!135 = !DILocalVariable(name: "dest", scope: !136, file: !17, line: 62, type: !48)
!136 = distinct !DILexicalBlock(scope: !132, file: !17, line: 61, column: 5)
!137 = !DILocation(line: 62, column: 17, scope: !136)
!138 = !DILocalVariable(name: "i", scope: !136, file: !17, line: 63, type: !53)
!139 = !DILocation(line: 63, column: 16, scope: !136)
!140 = !DILocalVariable(name: "dataLen", scope: !136, file: !17, line: 63, type: !53)
!141 = !DILocation(line: 63, column: 19, scope: !136)
!142 = !DILocation(line: 64, column: 26, scope: !136)
!143 = !DILocation(line: 64, column: 19, scope: !136)
!144 = !DILocation(line: 64, column: 17, scope: !136)
!145 = !DILocation(line: 66, column: 16, scope: !146)
!146 = distinct !DILexicalBlock(scope: !136, file: !17, line: 66, column: 9)
!147 = !DILocation(line: 66, column: 14, scope: !146)
!148 = !DILocation(line: 66, column: 21, scope: !149)
!149 = distinct !DILexicalBlock(scope: !146, file: !17, line: 66, column: 9)
!150 = !DILocation(line: 66, column: 25, scope: !149)
!151 = !DILocation(line: 66, column: 23, scope: !149)
!152 = !DILocation(line: 66, column: 9, scope: !146)
!153 = !DILocation(line: 68, column: 23, scope: !154)
!154 = distinct !DILexicalBlock(scope: !149, file: !17, line: 67, column: 9)
!155 = !DILocation(line: 68, column: 28, scope: !154)
!156 = !DILocation(line: 68, column: 18, scope: !154)
!157 = !DILocation(line: 68, column: 13, scope: !154)
!158 = !DILocation(line: 68, column: 21, scope: !154)
!159 = !DILocation(line: 69, column: 9, scope: !154)
!160 = !DILocation(line: 66, column: 35, scope: !149)
!161 = !DILocation(line: 66, column: 9, scope: !149)
!162 = distinct !{!162, !152, !163, !80}
!163 = !DILocation(line: 69, column: 9, scope: !146)
!164 = !DILocation(line: 70, column: 9, scope: !136)
!165 = !DILocation(line: 70, column: 20, scope: !136)
!166 = !DILocation(line: 71, column: 20, scope: !136)
!167 = !DILocation(line: 71, column: 9, scope: !136)
!168 = !DILocation(line: 72, column: 14, scope: !136)
!169 = !DILocation(line: 72, column: 9, scope: !136)
!170 = !DILocation(line: 74, column: 1, scope: !132)
