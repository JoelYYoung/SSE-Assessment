; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_17.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_17_bad() #0 !dbg !16 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i3 = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !24
  %0 = bitcast i8* %call to i32*, !dbg !25
  store i32* %0, i32** %data, align 8, !dbg !26
  %1 = load i32*, i32** %data, align 8, !dbg !27
  %cmp = icmp eq i32* %1, null, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !33
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !36
  %cmp1 = icmp slt i32 %2, 1, !dbg !38
  br i1 %cmp1, label %for.body, label %for.end, !dbg !39

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !40
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #7, !dbg !42
  %4 = load i32*, i32** %data, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !43
  store i32 0, i32* %arrayidx, align 4, !dbg !44
  br label %for.inc, !dbg !45

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !46
  %inc = add nsw i32 %5, 1, !dbg !46
  store i32 %inc, i32* %i, align 4, !dbg !46
  br label %for.cond, !dbg !47, !llvm.loop !48

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !51, metadata !DIExpression()), !dbg !56
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !56
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !56
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !57, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !61, metadata !DIExpression()), !dbg !62
  %7 = load i32*, i32** %data, align 8, !dbg !63
  %call4 = call i64 @wcslen(i32* %7) #9, !dbg !64
  store i64 %call4, i64* %dataLen, align 8, !dbg !65
  store i64 0, i64* %i3, align 8, !dbg !66
  br label %for.cond5, !dbg !68

for.cond5:                                        ; preds = %for.inc10, %for.end
  %8 = load i64, i64* %i3, align 8, !dbg !69
  %9 = load i64, i64* %dataLen, align 8, !dbg !71
  %cmp6 = icmp ult i64 %8, %9, !dbg !72
  br i1 %cmp6, label %for.body7, label %for.end12, !dbg !73

for.body7:                                        ; preds = %for.cond5
  %10 = load i32*, i32** %data, align 8, !dbg !74
  %11 = load i64, i64* %i3, align 8, !dbg !76
  %arrayidx8 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !74
  %12 = load i32, i32* %arrayidx8, align 4, !dbg !74
  %13 = load i64, i64* %i3, align 8, !dbg !77
  %arrayidx9 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %13, !dbg !78
  store i32 %12, i32* %arrayidx9, align 4, !dbg !79
  br label %for.inc10, !dbg !80

for.inc10:                                        ; preds = %for.body7
  %14 = load i64, i64* %i3, align 8, !dbg !81
  %inc11 = add i64 %14, 1, !dbg !81
  store i64 %inc11, i64* %i3, align 8, !dbg !81
  br label %for.cond5, !dbg !82, !llvm.loop !83

for.end12:                                        ; preds = %for.cond5
  %arrayidx13 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !85
  store i32 0, i32* %arrayidx13, align 4, !dbg !86
  %15 = load i32*, i32** %data, align 8, !dbg !87
  call void @printWLine(i32* %15), !dbg !88
  %16 = load i32*, i32** %data, align 8, !dbg !89
  %17 = bitcast i32* %16 to i8*, !dbg !89
  call void @free(i8* %17) #7, !dbg !90
  ret void, !dbg !91
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_17_good() #0 !dbg !92 {
entry:
  call void @goodG2B(), !dbg !93
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !95 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !101, metadata !DIExpression()), !dbg !102
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !103, metadata !DIExpression()), !dbg !104
  %call = call i64 @time(i64* null) #7, !dbg !105
  %conv = trunc i64 %call to i32, !dbg !106
  call void @srand(i32 %conv) #7, !dbg !107
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !108
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_17_good(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !111
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_17_bad(), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !113
  ret i32 0, !dbg !114
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !115 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata i32** %data, metadata !118, metadata !DIExpression()), !dbg !119
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !120
  %0 = bitcast i8* %call to i32*, !dbg !121
  store i32* %0, i32** %data, align 8, !dbg !122
  %1 = load i32*, i32** %data, align 8, !dbg !123
  %cmp = icmp eq i32* %1, null, !dbg !125
  br i1 %cmp, label %if.then, label %if.end, !dbg !126

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !127
  unreachable, !dbg !127

if.end:                                           ; preds = %entry
  store i32 0, i32* %h, align 4, !dbg !129
  br label %for.cond, !dbg !131

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %h, align 4, !dbg !132
  %cmp1 = icmp slt i32 %2, 1, !dbg !134
  br i1 %cmp1, label %for.body, label %for.end, !dbg !135

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !136
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !138
  %4 = load i32*, i32** %data, align 8, !dbg !139
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !139
  store i32 0, i32* %arrayidx, align 4, !dbg !140
  br label %for.inc, !dbg !141

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %h, align 4, !dbg !142
  %inc = add nsw i32 %5, 1, !dbg !142
  store i32 %inc, i32* %h, align 4, !dbg !142
  br label %for.cond, !dbg !143, !llvm.loop !144

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !146, metadata !DIExpression()), !dbg !148
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !148
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !148
  call void @llvm.dbg.declare(metadata i64* %i, metadata !149, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !151, metadata !DIExpression()), !dbg !152
  %7 = load i32*, i32** %data, align 8, !dbg !153
  %call3 = call i64 @wcslen(i32* %7) #9, !dbg !154
  store i64 %call3, i64* %dataLen, align 8, !dbg !155
  store i64 0, i64* %i, align 8, !dbg !156
  br label %for.cond4, !dbg !158

for.cond4:                                        ; preds = %for.inc9, %for.end
  %8 = load i64, i64* %i, align 8, !dbg !159
  %9 = load i64, i64* %dataLen, align 8, !dbg !161
  %cmp5 = icmp ult i64 %8, %9, !dbg !162
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !163

for.body6:                                        ; preds = %for.cond4
  %10 = load i32*, i32** %data, align 8, !dbg !164
  %11 = load i64, i64* %i, align 8, !dbg !166
  %arrayidx7 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !164
  %12 = load i32, i32* %arrayidx7, align 4, !dbg !164
  %13 = load i64, i64* %i, align 8, !dbg !167
  %arrayidx8 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %13, !dbg !168
  store i32 %12, i32* %arrayidx8, align 4, !dbg !169
  br label %for.inc9, !dbg !170

for.inc9:                                         ; preds = %for.body6
  %14 = load i64, i64* %i, align 8, !dbg !171
  %inc10 = add i64 %14, 1, !dbg !171
  store i64 %inc10, i64* %i, align 8, !dbg !171
  br label %for.cond4, !dbg !172, !llvm.loop !173

for.end11:                                        ; preds = %for.cond4
  %arrayidx12 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !175
  store i32 0, i32* %arrayidx12, align 4, !dbg !176
  %15 = load i32*, i32** %data, align 8, !dbg !177
  call void @printWLine(i32* %15), !dbg !178
  %16 = load i32*, i32** %data, align 8, !dbg !179
  %17 = bitcast i32* %16 to i8*, !dbg !179
  call void @free(i8* %17) #7, !dbg !180
  ret void, !dbg !181
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_17_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_17.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "i", scope: !16, file: !17, line: 25, type: !7)
!21 = !DILocation(line: 25, column: 9, scope: !16)
!22 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 26, type: !4)
!23 = !DILocation(line: 26, column: 15, scope: !16)
!24 = !DILocation(line: 27, column: 23, scope: !16)
!25 = !DILocation(line: 27, column: 12, scope: !16)
!26 = !DILocation(line: 27, column: 10, scope: !16)
!27 = !DILocation(line: 28, column: 9, scope: !28)
!28 = distinct !DILexicalBlock(scope: !16, file: !17, line: 28, column: 9)
!29 = !DILocation(line: 28, column: 14, scope: !28)
!30 = !DILocation(line: 28, column: 9, scope: !16)
!31 = !DILocation(line: 28, column: 24, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !17, line: 28, column: 23)
!33 = !DILocation(line: 29, column: 11, scope: !34)
!34 = distinct !DILexicalBlock(scope: !16, file: !17, line: 29, column: 5)
!35 = !DILocation(line: 29, column: 9, scope: !34)
!36 = !DILocation(line: 29, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !17, line: 29, column: 5)
!38 = !DILocation(line: 29, column: 18, scope: !37)
!39 = !DILocation(line: 29, column: 5, scope: !34)
!40 = !DILocation(line: 32, column: 17, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !17, line: 30, column: 5)
!42 = !DILocation(line: 32, column: 9, scope: !41)
!43 = !DILocation(line: 33, column: 9, scope: !41)
!44 = !DILocation(line: 33, column: 21, scope: !41)
!45 = !DILocation(line: 34, column: 5, scope: !41)
!46 = !DILocation(line: 29, column: 24, scope: !37)
!47 = !DILocation(line: 29, column: 5, scope: !37)
!48 = distinct !{!48, !39, !49, !50}
!49 = !DILocation(line: 34, column: 5, scope: !34)
!50 = !{!"llvm.loop.mustprogress"}
!51 = !DILocalVariable(name: "dest", scope: !52, file: !17, line: 36, type: !53)
!52 = distinct !DILexicalBlock(scope: !16, file: !17, line: 35, column: 5)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 50)
!56 = !DILocation(line: 36, column: 17, scope: !52)
!57 = !DILocalVariable(name: "i", scope: !52, file: !17, line: 37, type: !58)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !59)
!59 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!60 = !DILocation(line: 37, column: 16, scope: !52)
!61 = !DILocalVariable(name: "dataLen", scope: !52, file: !17, line: 37, type: !58)
!62 = !DILocation(line: 37, column: 19, scope: !52)
!63 = !DILocation(line: 38, column: 26, scope: !52)
!64 = !DILocation(line: 38, column: 19, scope: !52)
!65 = !DILocation(line: 38, column: 17, scope: !52)
!66 = !DILocation(line: 40, column: 16, scope: !67)
!67 = distinct !DILexicalBlock(scope: !52, file: !17, line: 40, column: 9)
!68 = !DILocation(line: 40, column: 14, scope: !67)
!69 = !DILocation(line: 40, column: 21, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !17, line: 40, column: 9)
!71 = !DILocation(line: 40, column: 25, scope: !70)
!72 = !DILocation(line: 40, column: 23, scope: !70)
!73 = !DILocation(line: 40, column: 9, scope: !67)
!74 = !DILocation(line: 42, column: 23, scope: !75)
!75 = distinct !DILexicalBlock(scope: !70, file: !17, line: 41, column: 9)
!76 = !DILocation(line: 42, column: 28, scope: !75)
!77 = !DILocation(line: 42, column: 18, scope: !75)
!78 = !DILocation(line: 42, column: 13, scope: !75)
!79 = !DILocation(line: 42, column: 21, scope: !75)
!80 = !DILocation(line: 43, column: 9, scope: !75)
!81 = !DILocation(line: 40, column: 35, scope: !70)
!82 = !DILocation(line: 40, column: 9, scope: !70)
!83 = distinct !{!83, !73, !84, !50}
!84 = !DILocation(line: 43, column: 9, scope: !67)
!85 = !DILocation(line: 44, column: 9, scope: !52)
!86 = !DILocation(line: 44, column: 20, scope: !52)
!87 = !DILocation(line: 45, column: 20, scope: !52)
!88 = !DILocation(line: 45, column: 9, scope: !52)
!89 = !DILocation(line: 46, column: 14, scope: !52)
!90 = !DILocation(line: 46, column: 9, scope: !52)
!91 = !DILocation(line: 48, column: 1, scope: !16)
!92 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_17_good", scope: !17, file: !17, line: 82, type: !18, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocation(line: 84, column: 5, scope: !92)
!94 = !DILocation(line: 85, column: 1, scope: !92)
!95 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 97, type: !96, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DISubroutineType(types: !97)
!97 = !{!7, !7, !98}
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!101 = !DILocalVariable(name: "argc", arg: 1, scope: !95, file: !17, line: 97, type: !7)
!102 = !DILocation(line: 97, column: 14, scope: !95)
!103 = !DILocalVariable(name: "argv", arg: 2, scope: !95, file: !17, line: 97, type: !98)
!104 = !DILocation(line: 97, column: 27, scope: !95)
!105 = !DILocation(line: 100, column: 22, scope: !95)
!106 = !DILocation(line: 100, column: 12, scope: !95)
!107 = !DILocation(line: 100, column: 5, scope: !95)
!108 = !DILocation(line: 102, column: 5, scope: !95)
!109 = !DILocation(line: 103, column: 5, scope: !95)
!110 = !DILocation(line: 104, column: 5, scope: !95)
!111 = !DILocation(line: 107, column: 5, scope: !95)
!112 = !DILocation(line: 108, column: 5, scope: !95)
!113 = !DILocation(line: 109, column: 5, scope: !95)
!114 = !DILocation(line: 111, column: 5, scope: !95)
!115 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 55, type: !18, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DILocalVariable(name: "h", scope: !115, file: !17, line: 57, type: !7)
!117 = !DILocation(line: 57, column: 9, scope: !115)
!118 = !DILocalVariable(name: "data", scope: !115, file: !17, line: 58, type: !4)
!119 = !DILocation(line: 58, column: 15, scope: !115)
!120 = !DILocation(line: 59, column: 23, scope: !115)
!121 = !DILocation(line: 59, column: 12, scope: !115)
!122 = !DILocation(line: 59, column: 10, scope: !115)
!123 = !DILocation(line: 60, column: 9, scope: !124)
!124 = distinct !DILexicalBlock(scope: !115, file: !17, line: 60, column: 9)
!125 = !DILocation(line: 60, column: 14, scope: !124)
!126 = !DILocation(line: 60, column: 9, scope: !115)
!127 = !DILocation(line: 60, column: 24, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !17, line: 60, column: 23)
!129 = !DILocation(line: 61, column: 11, scope: !130)
!130 = distinct !DILexicalBlock(scope: !115, file: !17, line: 61, column: 5)
!131 = !DILocation(line: 61, column: 9, scope: !130)
!132 = !DILocation(line: 61, column: 16, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !17, line: 61, column: 5)
!134 = !DILocation(line: 61, column: 18, scope: !133)
!135 = !DILocation(line: 61, column: 5, scope: !130)
!136 = !DILocation(line: 64, column: 17, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !17, line: 62, column: 5)
!138 = !DILocation(line: 64, column: 9, scope: !137)
!139 = !DILocation(line: 65, column: 9, scope: !137)
!140 = !DILocation(line: 65, column: 20, scope: !137)
!141 = !DILocation(line: 66, column: 5, scope: !137)
!142 = !DILocation(line: 61, column: 24, scope: !133)
!143 = !DILocation(line: 61, column: 5, scope: !133)
!144 = distinct !{!144, !135, !145, !50}
!145 = !DILocation(line: 66, column: 5, scope: !130)
!146 = !DILocalVariable(name: "dest", scope: !147, file: !17, line: 68, type: !53)
!147 = distinct !DILexicalBlock(scope: !115, file: !17, line: 67, column: 5)
!148 = !DILocation(line: 68, column: 17, scope: !147)
!149 = !DILocalVariable(name: "i", scope: !147, file: !17, line: 69, type: !58)
!150 = !DILocation(line: 69, column: 16, scope: !147)
!151 = !DILocalVariable(name: "dataLen", scope: !147, file: !17, line: 69, type: !58)
!152 = !DILocation(line: 69, column: 19, scope: !147)
!153 = !DILocation(line: 70, column: 26, scope: !147)
!154 = !DILocation(line: 70, column: 19, scope: !147)
!155 = !DILocation(line: 70, column: 17, scope: !147)
!156 = !DILocation(line: 72, column: 16, scope: !157)
!157 = distinct !DILexicalBlock(scope: !147, file: !17, line: 72, column: 9)
!158 = !DILocation(line: 72, column: 14, scope: !157)
!159 = !DILocation(line: 72, column: 21, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !17, line: 72, column: 9)
!161 = !DILocation(line: 72, column: 25, scope: !160)
!162 = !DILocation(line: 72, column: 23, scope: !160)
!163 = !DILocation(line: 72, column: 9, scope: !157)
!164 = !DILocation(line: 74, column: 23, scope: !165)
!165 = distinct !DILexicalBlock(scope: !160, file: !17, line: 73, column: 9)
!166 = !DILocation(line: 74, column: 28, scope: !165)
!167 = !DILocation(line: 74, column: 18, scope: !165)
!168 = !DILocation(line: 74, column: 13, scope: !165)
!169 = !DILocation(line: 74, column: 21, scope: !165)
!170 = !DILocation(line: 75, column: 9, scope: !165)
!171 = !DILocation(line: 72, column: 35, scope: !160)
!172 = !DILocation(line: 72, column: 9, scope: !160)
!173 = distinct !{!173, !163, !174, !50}
!174 = !DILocation(line: 75, column: 9, scope: !157)
!175 = !DILocation(line: 76, column: 9, scope: !147)
!176 = !DILocation(line: 76, column: 20, scope: !147)
!177 = !DILocation(line: 77, column: 20, scope: !147)
!178 = !DILocation(line: 77, column: 9, scope: !147)
!179 = !DILocation(line: 78, column: 14, scope: !147)
!180 = !DILocation(line: 78, column: 9, scope: !147)
!181 = !DILocation(line: 80, column: 1, scope: !115)
