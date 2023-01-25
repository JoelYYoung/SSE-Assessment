; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_44.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_44_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !22, metadata !DIExpression()), !dbg !26
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !28
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %data, align 8, !dbg !30
  %1 = load i32*, i32** %data, align 8, !dbg !31
  %cmp = icmp eq i32* %1, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !37
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #6, !dbg !38
  %3 = load i32*, i32** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  %4 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !41
  %5 = load i32*, i32** %data, align 8, !dbg !42
  call void %4(i32* %5), !dbg !41
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32* %data) #0 !dbg !44 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !54, metadata !DIExpression()), !dbg !58
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !59
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !60
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !61
  store i32 0, i32* %arrayidx, align 4, !dbg !62
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !63
  %call2 = call i64 @wcslen(i32* %arraydecay1) #8, !dbg !64
  store i64 %call2, i64* %destLen, align 8, !dbg !65
  store i64 0, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !68

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !69
  %1 = load i64, i64* %destLen, align 8, !dbg !71
  %cmp = icmp ult i64 %0, %1, !dbg !72
  br i1 %cmp, label %for.body, label %for.end, !dbg !73

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data.addr, align 8, !dbg !74
  %3 = load i64, i64* %i, align 8, !dbg !76
  %arrayidx3 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !74
  %4 = load i32, i32* %arrayidx3, align 4, !dbg !74
  %5 = load i64, i64* %i, align 8, !dbg !77
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !78
  store i32 %4, i32* %arrayidx4, align 4, !dbg !79
  br label %for.inc, !dbg !80

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !81
  %inc = add i64 %6, 1, !dbg !81
  store i64 %inc, i64* %i, align 8, !dbg !81
  br label %for.cond, !dbg !82, !llvm.loop !83

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !86
  store i32 0, i32* %arrayidx5, align 4, !dbg !87
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !88
  call void @printWLine(i32* %arraydecay6), !dbg !89
  %7 = load i32*, i32** %data.addr, align 8, !dbg !90
  %8 = bitcast i32* %7 to i8*, !dbg !90
  call void @free(i8* %8) #6, !dbg !91
  ret void, !dbg !92
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_44_good() #0 !dbg !93 {
entry:
  call void @goodG2B(), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !96 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !102, metadata !DIExpression()), !dbg !103
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !104, metadata !DIExpression()), !dbg !105
  %call = call i64 @time(i64* null) #6, !dbg !106
  %conv = trunc i64 %call to i32, !dbg !107
  call void @srand(i32 %conv) #6, !dbg !108
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !109
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_44_good(), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !111
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !112
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_44_bad(), !dbg !113
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !114
  ret i32 0, !dbg !115
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !116 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !119, metadata !DIExpression()), !dbg !120
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !120
  store i32* null, i32** %data, align 8, !dbg !121
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !122
  %0 = bitcast i8* %call to i32*, !dbg !123
  store i32* %0, i32** %data, align 8, !dbg !124
  %1 = load i32*, i32** %data, align 8, !dbg !125
  %cmp = icmp eq i32* %1, null, !dbg !127
  br i1 %cmp, label %if.then, label %if.end, !dbg !128

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !129
  unreachable, !dbg !129

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !131
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !132
  %3 = load i32*, i32** %data, align 8, !dbg !133
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !133
  store i32 0, i32* %arrayidx, align 4, !dbg !134
  %4 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !135
  %5 = load i32*, i32** %data, align 8, !dbg !136
  call void %4(i32* %5), !dbg !135
  ret void, !dbg !137
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !138 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !139, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata i64* %i, metadata !141, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !144, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !146, metadata !DIExpression()), !dbg !147
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !148
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !149
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !150
  store i32 0, i32* %arrayidx, align 4, !dbg !151
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !152
  %call2 = call i64 @wcslen(i32* %arraydecay1) #8, !dbg !153
  store i64 %call2, i64* %destLen, align 8, !dbg !154
  store i64 0, i64* %i, align 8, !dbg !155
  br label %for.cond, !dbg !157

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !158
  %1 = load i64, i64* %destLen, align 8, !dbg !160
  %cmp = icmp ult i64 %0, %1, !dbg !161
  br i1 %cmp, label %for.body, label %for.end, !dbg !162

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data.addr, align 8, !dbg !163
  %3 = load i64, i64* %i, align 8, !dbg !165
  %arrayidx3 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !163
  %4 = load i32, i32* %arrayidx3, align 4, !dbg !163
  %5 = load i64, i64* %i, align 8, !dbg !166
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !167
  store i32 %4, i32* %arrayidx4, align 4, !dbg !168
  br label %for.inc, !dbg !169

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !170
  %inc = add i64 %6, 1, !dbg !170
  store i64 %inc, i64* %i, align 8, !dbg !170
  br label %for.cond, !dbg !171, !llvm.loop !172

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !174
  store i32 0, i32* %arrayidx5, align 4, !dbg !175
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !176
  call void @printWLine(i32* %arraydecay6), !dbg !177
  %7 = load i32*, i32** %data.addr, align 8, !dbg !178
  %8 = bitcast i32* %7 to i8*, !dbg !178
  call void @free(i8* %8) #6, !dbg !179
  ret void, !dbg !180
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_44.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_44_bad", scope: !17, file: !17, line: 43, type: !18, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_44.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 45, type: !4)
!21 = !DILocation(line: 45, column: 15, scope: !16)
!22 = !DILocalVariable(name: "funcPtr", scope: !16, file: !17, line: 47, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DISubroutineType(types: !25)
!25 = !{null, !4}
!26 = !DILocation(line: 47, column: 12, scope: !16)
!27 = !DILocation(line: 48, column: 10, scope: !16)
!28 = !DILocation(line: 50, column: 23, scope: !16)
!29 = !DILocation(line: 50, column: 12, scope: !16)
!30 = !DILocation(line: 50, column: 10, scope: !16)
!31 = !DILocation(line: 51, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !16, file: !17, line: 51, column: 9)
!33 = !DILocation(line: 51, column: 14, scope: !32)
!34 = !DILocation(line: 51, column: 9, scope: !16)
!35 = !DILocation(line: 51, column: 24, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !17, line: 51, column: 23)
!37 = !DILocation(line: 52, column: 13, scope: !16)
!38 = !DILocation(line: 52, column: 5, scope: !16)
!39 = !DILocation(line: 53, column: 5, scope: !16)
!40 = !DILocation(line: 53, column: 16, scope: !16)
!41 = !DILocation(line: 55, column: 5, scope: !16)
!42 = !DILocation(line: 55, column: 13, scope: !16)
!43 = !DILocation(line: 56, column: 1, scope: !16)
!44 = distinct !DISubprogram(name: "badSink", scope: !17, file: !17, line: 23, type: !24, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DILocalVariable(name: "data", arg: 1, scope: !44, file: !17, line: 23, type: !4)
!46 = !DILocation(line: 23, column: 31, scope: !44)
!47 = !DILocalVariable(name: "i", scope: !48, file: !17, line: 26, type: !49)
!48 = distinct !DILexicalBlock(scope: !44, file: !17, line: 25, column: 5)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !50)
!50 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 26, column: 16, scope: !48)
!52 = !DILocalVariable(name: "destLen", scope: !48, file: !17, line: 26, type: !49)
!53 = !DILocation(line: 26, column: 19, scope: !48)
!54 = !DILocalVariable(name: "dest", scope: !48, file: !17, line: 27, type: !55)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !56)
!56 = !{!57}
!57 = !DISubrange(count: 100)
!58 = !DILocation(line: 27, column: 17, scope: !48)
!59 = !DILocation(line: 28, column: 17, scope: !48)
!60 = !DILocation(line: 28, column: 9, scope: !48)
!61 = !DILocation(line: 29, column: 9, scope: !48)
!62 = !DILocation(line: 29, column: 21, scope: !48)
!63 = !DILocation(line: 30, column: 26, scope: !48)
!64 = !DILocation(line: 30, column: 19, scope: !48)
!65 = !DILocation(line: 30, column: 17, scope: !48)
!66 = !DILocation(line: 33, column: 16, scope: !67)
!67 = distinct !DILexicalBlock(scope: !48, file: !17, line: 33, column: 9)
!68 = !DILocation(line: 33, column: 14, scope: !67)
!69 = !DILocation(line: 33, column: 21, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !17, line: 33, column: 9)
!71 = !DILocation(line: 33, column: 25, scope: !70)
!72 = !DILocation(line: 33, column: 23, scope: !70)
!73 = !DILocation(line: 33, column: 9, scope: !67)
!74 = !DILocation(line: 35, column: 23, scope: !75)
!75 = distinct !DILexicalBlock(scope: !70, file: !17, line: 34, column: 9)
!76 = !DILocation(line: 35, column: 28, scope: !75)
!77 = !DILocation(line: 35, column: 18, scope: !75)
!78 = !DILocation(line: 35, column: 13, scope: !75)
!79 = !DILocation(line: 35, column: 21, scope: !75)
!80 = !DILocation(line: 36, column: 9, scope: !75)
!81 = !DILocation(line: 33, column: 35, scope: !70)
!82 = !DILocation(line: 33, column: 9, scope: !70)
!83 = distinct !{!83, !73, !84, !85}
!84 = !DILocation(line: 36, column: 9, scope: !67)
!85 = !{!"llvm.loop.mustprogress"}
!86 = !DILocation(line: 37, column: 9, scope: !48)
!87 = !DILocation(line: 37, column: 21, scope: !48)
!88 = !DILocation(line: 38, column: 20, scope: !48)
!89 = !DILocation(line: 38, column: 9, scope: !48)
!90 = !DILocation(line: 39, column: 14, scope: !48)
!91 = !DILocation(line: 39, column: 9, scope: !48)
!92 = !DILocation(line: 41, column: 1, scope: !44)
!93 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_44_good", scope: !17, file: !17, line: 96, type: !18, scopeLine: 97, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocation(line: 98, column: 5, scope: !93)
!95 = !DILocation(line: 99, column: 1, scope: !93)
!96 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 110, type: !97, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DISubroutineType(types: !98)
!98 = !{!7, !7, !99}
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!101 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!102 = !DILocalVariable(name: "argc", arg: 1, scope: !96, file: !17, line: 110, type: !7)
!103 = !DILocation(line: 110, column: 14, scope: !96)
!104 = !DILocalVariable(name: "argv", arg: 2, scope: !96, file: !17, line: 110, type: !99)
!105 = !DILocation(line: 110, column: 27, scope: !96)
!106 = !DILocation(line: 113, column: 22, scope: !96)
!107 = !DILocation(line: 113, column: 12, scope: !96)
!108 = !DILocation(line: 113, column: 5, scope: !96)
!109 = !DILocation(line: 115, column: 5, scope: !96)
!110 = !DILocation(line: 116, column: 5, scope: !96)
!111 = !DILocation(line: 117, column: 5, scope: !96)
!112 = !DILocation(line: 120, column: 5, scope: !96)
!113 = !DILocation(line: 121, column: 5, scope: !96)
!114 = !DILocation(line: 122, column: 5, scope: !96)
!115 = !DILocation(line: 124, column: 5, scope: !96)
!116 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 83, type: !18, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!117 = !DILocalVariable(name: "data", scope: !116, file: !17, line: 85, type: !4)
!118 = !DILocation(line: 85, column: 15, scope: !116)
!119 = !DILocalVariable(name: "funcPtr", scope: !116, file: !17, line: 86, type: !23)
!120 = !DILocation(line: 86, column: 12, scope: !116)
!121 = !DILocation(line: 87, column: 10, scope: !116)
!122 = !DILocation(line: 89, column: 23, scope: !116)
!123 = !DILocation(line: 89, column: 12, scope: !116)
!124 = !DILocation(line: 89, column: 10, scope: !116)
!125 = !DILocation(line: 90, column: 9, scope: !126)
!126 = distinct !DILexicalBlock(scope: !116, file: !17, line: 90, column: 9)
!127 = !DILocation(line: 90, column: 14, scope: !126)
!128 = !DILocation(line: 90, column: 9, scope: !116)
!129 = !DILocation(line: 90, column: 24, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !17, line: 90, column: 23)
!131 = !DILocation(line: 91, column: 13, scope: !116)
!132 = !DILocation(line: 91, column: 5, scope: !116)
!133 = !DILocation(line: 92, column: 5, scope: !116)
!134 = !DILocation(line: 92, column: 17, scope: !116)
!135 = !DILocation(line: 93, column: 5, scope: !116)
!136 = !DILocation(line: 93, column: 13, scope: !116)
!137 = !DILocation(line: 94, column: 1, scope: !116)
!138 = distinct !DISubprogram(name: "goodG2BSink", scope: !17, file: !17, line: 63, type: !24, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!139 = !DILocalVariable(name: "data", arg: 1, scope: !138, file: !17, line: 63, type: !4)
!140 = !DILocation(line: 63, column: 35, scope: !138)
!141 = !DILocalVariable(name: "i", scope: !142, file: !17, line: 66, type: !49)
!142 = distinct !DILexicalBlock(scope: !138, file: !17, line: 65, column: 5)
!143 = !DILocation(line: 66, column: 16, scope: !142)
!144 = !DILocalVariable(name: "destLen", scope: !142, file: !17, line: 66, type: !49)
!145 = !DILocation(line: 66, column: 19, scope: !142)
!146 = !DILocalVariable(name: "dest", scope: !142, file: !17, line: 67, type: !55)
!147 = !DILocation(line: 67, column: 17, scope: !142)
!148 = !DILocation(line: 68, column: 17, scope: !142)
!149 = !DILocation(line: 68, column: 9, scope: !142)
!150 = !DILocation(line: 69, column: 9, scope: !142)
!151 = !DILocation(line: 69, column: 21, scope: !142)
!152 = !DILocation(line: 70, column: 26, scope: !142)
!153 = !DILocation(line: 70, column: 19, scope: !142)
!154 = !DILocation(line: 70, column: 17, scope: !142)
!155 = !DILocation(line: 73, column: 16, scope: !156)
!156 = distinct !DILexicalBlock(scope: !142, file: !17, line: 73, column: 9)
!157 = !DILocation(line: 73, column: 14, scope: !156)
!158 = !DILocation(line: 73, column: 21, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !17, line: 73, column: 9)
!160 = !DILocation(line: 73, column: 25, scope: !159)
!161 = !DILocation(line: 73, column: 23, scope: !159)
!162 = !DILocation(line: 73, column: 9, scope: !156)
!163 = !DILocation(line: 75, column: 23, scope: !164)
!164 = distinct !DILexicalBlock(scope: !159, file: !17, line: 74, column: 9)
!165 = !DILocation(line: 75, column: 28, scope: !164)
!166 = !DILocation(line: 75, column: 18, scope: !164)
!167 = !DILocation(line: 75, column: 13, scope: !164)
!168 = !DILocation(line: 75, column: 21, scope: !164)
!169 = !DILocation(line: 76, column: 9, scope: !164)
!170 = !DILocation(line: 73, column: 35, scope: !159)
!171 = !DILocation(line: 73, column: 9, scope: !159)
!172 = distinct !{!172, !162, !173, !85}
!173 = !DILocation(line: 76, column: 9, scope: !156)
!174 = !DILocation(line: 77, column: 9, scope: !142)
!175 = !DILocation(line: 77, column: 21, scope: !142)
!176 = !DILocation(line: 78, column: 20, scope: !142)
!177 = !DILocation(line: 78, column: 9, scope: !142)
!178 = !DILocation(line: 79, column: 14, scope: !142)
!179 = !DILocation(line: 79, column: 9, scope: !142)
!180 = !DILocation(line: 81, column: 1, scope: !138)
