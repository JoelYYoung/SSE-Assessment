; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_44.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_loop_44_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !22, metadata !DIExpression()), !dbg !26
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !30
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !31
  %0 = bitcast i8* %call to i32*, !dbg !32
  store i32* %0, i32** %dataBuffer, align 8, !dbg !30
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !33
  %cmp = icmp eq i32* %1, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !39
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !40
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !43
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !44
  store i32* %add.ptr, i32** %data, align 8, !dbg !45
  %5 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !46
  %6 = load i32*, i32** %data, align 8, !dbg !47
  call void %5(i32* %6), !dbg !46
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32* %data) #0 !dbg !49 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !50, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %i, metadata !52, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !57, metadata !DIExpression()), !dbg !61
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !62
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !63
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !64
  store i32 0, i32* %arrayidx, align 4, !dbg !65
  store i64 0, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !68

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !69
  %cmp = icmp ult i64 %0, 100, !dbg !71
  br i1 %cmp, label %for.body, label %for.end, !dbg !72

for.body:                                         ; preds = %for.cond
  %1 = load i32*, i32** %data.addr, align 8, !dbg !73
  %2 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx1 = getelementptr inbounds i32, i32* %1, i64 %2, !dbg !73
  %3 = load i32, i32* %arrayidx1, align 4, !dbg !73
  %4 = load i64, i64* %i, align 8, !dbg !76
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %4, !dbg !77
  store i32 %3, i32* %arrayidx2, align 4, !dbg !78
  br label %for.inc, !dbg !79

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !80
  %inc = add i64 %5, 1, !dbg !80
  store i64 %inc, i64* %i, align 8, !dbg !80
  br label %for.cond, !dbg !81, !llvm.loop !82

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !85
  store i32 0, i32* %arrayidx3, align 4, !dbg !86
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !87
  call void @printWLine(i32* %arraydecay4), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_loop_44_good() #0 !dbg !90 {
entry:
  call void @goodG2B(), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !93 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !99, metadata !DIExpression()), !dbg !100
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !101, metadata !DIExpression()), !dbg !102
  %call = call i64 @time(i64* null) #5, !dbg !103
  %conv = trunc i64 %call to i32, !dbg !104
  call void @srand(i32 %conv) #5, !dbg !105
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !106
  call void @CWE127_Buffer_Underread__malloc_wchar_t_loop_44_good(), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !109
  call void @CWE127_Buffer_Underread__malloc_wchar_t_loop_44_bad(), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !111
  ret i32 0, !dbg !112
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !113 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !116, metadata !DIExpression()), !dbg !117
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !117
  store i32* null, i32** %data, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !119, metadata !DIExpression()), !dbg !121
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !122
  %0 = bitcast i8* %call to i32*, !dbg !123
  store i32* %0, i32** %dataBuffer, align 8, !dbg !121
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !124
  %cmp = icmp eq i32* %1, null, !dbg !126
  br i1 %cmp, label %if.then, label %if.end, !dbg !127

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !128
  unreachable, !dbg !128

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !130
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !131
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !132
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !132
  store i32 0, i32* %arrayidx, align 4, !dbg !133
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !134
  store i32* %4, i32** %data, align 8, !dbg !135
  %5 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !136
  %6 = load i32*, i32** %data, align 8, !dbg !137
  call void %5(i32* %6), !dbg !136
  ret void, !dbg !138
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !139 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata i64* %i, metadata !142, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !145, metadata !DIExpression()), !dbg !146
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !147
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !148
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !149
  store i32 0, i32* %arrayidx, align 4, !dbg !150
  store i64 0, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !153

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !154
  %cmp = icmp ult i64 %0, 100, !dbg !156
  br i1 %cmp, label %for.body, label %for.end, !dbg !157

for.body:                                         ; preds = %for.cond
  %1 = load i32*, i32** %data.addr, align 8, !dbg !158
  %2 = load i64, i64* %i, align 8, !dbg !160
  %arrayidx1 = getelementptr inbounds i32, i32* %1, i64 %2, !dbg !158
  %3 = load i32, i32* %arrayidx1, align 4, !dbg !158
  %4 = load i64, i64* %i, align 8, !dbg !161
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %4, !dbg !162
  store i32 %3, i32* %arrayidx2, align 4, !dbg !163
  br label %for.inc, !dbg !164

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !165
  %inc = add i64 %5, 1, !dbg !165
  store i64 %inc, i64* %i, align 8, !dbg !165
  br label %for.cond, !dbg !166, !llvm.loop !167

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !169
  store i32 0, i32* %arrayidx3, align 4, !dbg !170
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !171
  call void @printWLine(i32* %arraydecay4), !dbg !172
  ret void, !dbg !173
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_44.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_loop_44_bad", scope: !17, file: !17, line: 43, type: !18, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_44.c", directory: "/home/joelyang/SSE-Assessment")
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
!28 = !DILocalVariable(name: "dataBuffer", scope: !29, file: !17, line: 50, type: !4)
!29 = distinct !DILexicalBlock(scope: !16, file: !17, line: 49, column: 5)
!30 = !DILocation(line: 50, column: 19, scope: !29)
!31 = !DILocation(line: 50, column: 43, scope: !29)
!32 = !DILocation(line: 50, column: 32, scope: !29)
!33 = !DILocation(line: 51, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !29, file: !17, line: 51, column: 13)
!35 = !DILocation(line: 51, column: 24, scope: !34)
!36 = !DILocation(line: 51, column: 13, scope: !29)
!37 = !DILocation(line: 51, column: 34, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !17, line: 51, column: 33)
!39 = !DILocation(line: 52, column: 17, scope: !29)
!40 = !DILocation(line: 52, column: 9, scope: !29)
!41 = !DILocation(line: 53, column: 9, scope: !29)
!42 = !DILocation(line: 53, column: 27, scope: !29)
!43 = !DILocation(line: 55, column: 16, scope: !29)
!44 = !DILocation(line: 55, column: 27, scope: !29)
!45 = !DILocation(line: 55, column: 14, scope: !29)
!46 = !DILocation(line: 58, column: 5, scope: !16)
!47 = !DILocation(line: 58, column: 13, scope: !16)
!48 = !DILocation(line: 59, column: 1, scope: !16)
!49 = distinct !DISubprogram(name: "badSink", scope: !17, file: !17, line: 23, type: !24, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocalVariable(name: "data", arg: 1, scope: !49, file: !17, line: 23, type: !4)
!51 = !DILocation(line: 23, column: 31, scope: !49)
!52 = !DILocalVariable(name: "i", scope: !53, file: !17, line: 26, type: !54)
!53 = distinct !DILexicalBlock(scope: !49, file: !17, line: 25, column: 5)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !55)
!55 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!56 = !DILocation(line: 26, column: 16, scope: !53)
!57 = !DILocalVariable(name: "dest", scope: !53, file: !17, line: 27, type: !58)
!58 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !59)
!59 = !{!60}
!60 = !DISubrange(count: 100)
!61 = !DILocation(line: 27, column: 17, scope: !53)
!62 = !DILocation(line: 28, column: 17, scope: !53)
!63 = !DILocation(line: 28, column: 9, scope: !53)
!64 = !DILocation(line: 29, column: 9, scope: !53)
!65 = !DILocation(line: 29, column: 21, scope: !53)
!66 = !DILocation(line: 31, column: 16, scope: !67)
!67 = distinct !DILexicalBlock(scope: !53, file: !17, line: 31, column: 9)
!68 = !DILocation(line: 31, column: 14, scope: !67)
!69 = !DILocation(line: 31, column: 21, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !17, line: 31, column: 9)
!71 = !DILocation(line: 31, column: 23, scope: !70)
!72 = !DILocation(line: 31, column: 9, scope: !67)
!73 = !DILocation(line: 33, column: 23, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !17, line: 32, column: 9)
!75 = !DILocation(line: 33, column: 28, scope: !74)
!76 = !DILocation(line: 33, column: 18, scope: !74)
!77 = !DILocation(line: 33, column: 13, scope: !74)
!78 = !DILocation(line: 33, column: 21, scope: !74)
!79 = !DILocation(line: 34, column: 9, scope: !74)
!80 = !DILocation(line: 31, column: 31, scope: !70)
!81 = !DILocation(line: 31, column: 9, scope: !70)
!82 = distinct !{!82, !72, !83, !84}
!83 = !DILocation(line: 34, column: 9, scope: !67)
!84 = !{!"llvm.loop.mustprogress"}
!85 = !DILocation(line: 36, column: 9, scope: !53)
!86 = !DILocation(line: 36, column: 21, scope: !53)
!87 = !DILocation(line: 37, column: 20, scope: !53)
!88 = !DILocation(line: 37, column: 9, scope: !53)
!89 = !DILocation(line: 41, column: 1, scope: !49)
!90 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_loop_44_good", scope: !17, file: !17, line: 102, type: !18, scopeLine: 103, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocation(line: 104, column: 5, scope: !90)
!92 = !DILocation(line: 105, column: 1, scope: !90)
!93 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 116, type: !94, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DISubroutineType(types: !95)
!95 = !{!7, !7, !96}
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!99 = !DILocalVariable(name: "argc", arg: 1, scope: !93, file: !17, line: 116, type: !7)
!100 = !DILocation(line: 116, column: 14, scope: !93)
!101 = !DILocalVariable(name: "argv", arg: 2, scope: !93, file: !17, line: 116, type: !96)
!102 = !DILocation(line: 116, column: 27, scope: !93)
!103 = !DILocation(line: 119, column: 22, scope: !93)
!104 = !DILocation(line: 119, column: 12, scope: !93)
!105 = !DILocation(line: 119, column: 5, scope: !93)
!106 = !DILocation(line: 121, column: 5, scope: !93)
!107 = !DILocation(line: 122, column: 5, scope: !93)
!108 = !DILocation(line: 123, column: 5, scope: !93)
!109 = !DILocation(line: 126, column: 5, scope: !93)
!110 = !DILocation(line: 127, column: 5, scope: !93)
!111 = !DILocation(line: 128, column: 5, scope: !93)
!112 = !DILocation(line: 130, column: 5, scope: !93)
!113 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 86, type: !18, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocalVariable(name: "data", scope: !113, file: !17, line: 88, type: !4)
!115 = !DILocation(line: 88, column: 15, scope: !113)
!116 = !DILocalVariable(name: "funcPtr", scope: !113, file: !17, line: 89, type: !23)
!117 = !DILocation(line: 89, column: 12, scope: !113)
!118 = !DILocation(line: 90, column: 10, scope: !113)
!119 = !DILocalVariable(name: "dataBuffer", scope: !120, file: !17, line: 92, type: !4)
!120 = distinct !DILexicalBlock(scope: !113, file: !17, line: 91, column: 5)
!121 = !DILocation(line: 92, column: 19, scope: !120)
!122 = !DILocation(line: 92, column: 43, scope: !120)
!123 = !DILocation(line: 92, column: 32, scope: !120)
!124 = !DILocation(line: 93, column: 13, scope: !125)
!125 = distinct !DILexicalBlock(scope: !120, file: !17, line: 93, column: 13)
!126 = !DILocation(line: 93, column: 24, scope: !125)
!127 = !DILocation(line: 93, column: 13, scope: !120)
!128 = !DILocation(line: 93, column: 34, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !17, line: 93, column: 33)
!130 = !DILocation(line: 94, column: 17, scope: !120)
!131 = !DILocation(line: 94, column: 9, scope: !120)
!132 = !DILocation(line: 95, column: 9, scope: !120)
!133 = !DILocation(line: 95, column: 27, scope: !120)
!134 = !DILocation(line: 97, column: 16, scope: !120)
!135 = !DILocation(line: 97, column: 14, scope: !120)
!136 = !DILocation(line: 99, column: 5, scope: !113)
!137 = !DILocation(line: 99, column: 13, scope: !113)
!138 = !DILocation(line: 100, column: 1, scope: !113)
!139 = distinct !DISubprogram(name: "goodG2BSink", scope: !17, file: !17, line: 66, type: !24, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!140 = !DILocalVariable(name: "data", arg: 1, scope: !139, file: !17, line: 66, type: !4)
!141 = !DILocation(line: 66, column: 35, scope: !139)
!142 = !DILocalVariable(name: "i", scope: !143, file: !17, line: 69, type: !54)
!143 = distinct !DILexicalBlock(scope: !139, file: !17, line: 68, column: 5)
!144 = !DILocation(line: 69, column: 16, scope: !143)
!145 = !DILocalVariable(name: "dest", scope: !143, file: !17, line: 70, type: !58)
!146 = !DILocation(line: 70, column: 17, scope: !143)
!147 = !DILocation(line: 71, column: 17, scope: !143)
!148 = !DILocation(line: 71, column: 9, scope: !143)
!149 = !DILocation(line: 72, column: 9, scope: !143)
!150 = !DILocation(line: 72, column: 21, scope: !143)
!151 = !DILocation(line: 74, column: 16, scope: !152)
!152 = distinct !DILexicalBlock(scope: !143, file: !17, line: 74, column: 9)
!153 = !DILocation(line: 74, column: 14, scope: !152)
!154 = !DILocation(line: 74, column: 21, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !17, line: 74, column: 9)
!156 = !DILocation(line: 74, column: 23, scope: !155)
!157 = !DILocation(line: 74, column: 9, scope: !152)
!158 = !DILocation(line: 76, column: 23, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !17, line: 75, column: 9)
!160 = !DILocation(line: 76, column: 28, scope: !159)
!161 = !DILocation(line: 76, column: 18, scope: !159)
!162 = !DILocation(line: 76, column: 13, scope: !159)
!163 = !DILocation(line: 76, column: 21, scope: !159)
!164 = !DILocation(line: 77, column: 9, scope: !159)
!165 = !DILocation(line: 74, column: 31, scope: !155)
!166 = !DILocation(line: 74, column: 9, scope: !155)
!167 = distinct !{!167, !157, !168, !84}
!168 = !DILocation(line: 77, column: 9, scope: !152)
!169 = !DILocation(line: 79, column: 9, scope: !143)
!170 = !DILocation(line: 79, column: 21, scope: !143)
!171 = !DILocation(line: 80, column: 20, scope: !143)
!172 = !DILocation(line: 80, column: 9, scope: !143)
!173 = !DILocation(line: 84, column: 1, scope: !139)
