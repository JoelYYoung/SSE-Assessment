; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_41.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_loop_41_badSink(i32* %data) #0 !dbg !16 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i64* %i, metadata !22, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !27, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !32
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !33
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  store i64 0, i64* %i, align 8, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !39
  %cmp = icmp ult i64 %0, 100, !dbg !41
  br i1 %cmp, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %1 = load i32*, i32** %data.addr, align 8, !dbg !43
  %2 = load i64, i64* %i, align 8, !dbg !45
  %arrayidx1 = getelementptr inbounds i32, i32* %1, i64 %2, !dbg !43
  %3 = load i32, i32* %arrayidx1, align 4, !dbg !43
  %4 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %4, !dbg !47
  store i32 %3, i32* %arrayidx2, align 4, !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !50
  %inc = add i64 %5, 1, !dbg !50
  store i64 %inc, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !55
  store i32 0, i32* %arrayidx3, align 4, !dbg !56
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !57
  call void @printWLine(i32* %arraydecay4), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_loop_41_bad() #0 !dbg !60 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !63, metadata !DIExpression()), !dbg !64
  store i32* null, i32** %data, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !66, metadata !DIExpression()), !dbg !68
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !69
  %0 = bitcast i8* %call to i32*, !dbg !70
  store i32* %0, i32** %dataBuffer, align 8, !dbg !68
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !71
  %cmp = icmp eq i32* %1, null, !dbg !73
  br i1 %cmp, label %if.then, label %if.end, !dbg !74

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !75
  unreachable, !dbg !75

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !77
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !78
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !79
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !79
  store i32 0, i32* %arrayidx, align 4, !dbg !80
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !81
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !82
  store i32* %add.ptr, i32** %data, align 8, !dbg !83
  %5 = load i32*, i32** %data, align 8, !dbg !84
  call void @CWE127_Buffer_Underread__malloc_wchar_t_loop_41_badSink(i32* %5), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_loop_41_goodG2BSink(i32* %data) #0 !dbg !87 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata i64* %i, metadata !90, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !93, metadata !DIExpression()), !dbg !94
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !95
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !96
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !97
  store i32 0, i32* %arrayidx, align 4, !dbg !98
  store i64 0, i64* %i, align 8, !dbg !99
  br label %for.cond, !dbg !101

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !102
  %cmp = icmp ult i64 %0, 100, !dbg !104
  br i1 %cmp, label %for.body, label %for.end, !dbg !105

for.body:                                         ; preds = %for.cond
  %1 = load i32*, i32** %data.addr, align 8, !dbg !106
  %2 = load i64, i64* %i, align 8, !dbg !108
  %arrayidx1 = getelementptr inbounds i32, i32* %1, i64 %2, !dbg !106
  %3 = load i32, i32* %arrayidx1, align 4, !dbg !106
  %4 = load i64, i64* %i, align 8, !dbg !109
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %4, !dbg !110
  store i32 %3, i32* %arrayidx2, align 4, !dbg !111
  br label %for.inc, !dbg !112

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !113
  %inc = add i64 %5, 1, !dbg !113
  store i64 %inc, i64* %i, align 8, !dbg !113
  br label %for.cond, !dbg !114, !llvm.loop !115

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !117
  store i32 0, i32* %arrayidx3, align 4, !dbg !118
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !119
  call void @printWLine(i32* %arraydecay4), !dbg !120
  ret void, !dbg !121
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_loop_41_good() #0 !dbg !122 {
entry:
  call void @goodG2B(), !dbg !123
  ret void, !dbg !124
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !125 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !131, metadata !DIExpression()), !dbg !132
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !133, metadata !DIExpression()), !dbg !134
  %call = call i64 @time(i64* null) #5, !dbg !135
  %conv = trunc i64 %call to i32, !dbg !136
  call void @srand(i32 %conv) #5, !dbg !137
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !138
  call void @CWE127_Buffer_Underread__malloc_wchar_t_loop_41_good(), !dbg !139
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !140
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !141
  call void @CWE127_Buffer_Underread__malloc_wchar_t_loop_41_bad(), !dbg !142
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !143
  ret i32 0, !dbg !144
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !145 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !146, metadata !DIExpression()), !dbg !147
  store i32* null, i32** %data, align 8, !dbg !148
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !149, metadata !DIExpression()), !dbg !151
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !152
  %0 = bitcast i8* %call to i32*, !dbg !153
  store i32* %0, i32** %dataBuffer, align 8, !dbg !151
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !154
  %cmp = icmp eq i32* %1, null, !dbg !156
  br i1 %cmp, label %if.then, label %if.end, !dbg !157

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !158
  unreachable, !dbg !158

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !160
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !161
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !162
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !162
  store i32 0, i32* %arrayidx, align 4, !dbg !163
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !164
  store i32* %4, i32** %data, align 8, !dbg !165
  %5 = load i32*, i32** %data, align 8, !dbg !166
  call void @CWE127_Buffer_Underread__malloc_wchar_t_loop_41_goodG2BSink(i32* %5), !dbg !167
  ret void, !dbg !168
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_loop_41_badSink", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null, !4}
!20 = !DILocalVariable(name: "data", arg: 1, scope: !16, file: !17, line: 23, type: !4)
!21 = !DILocation(line: 23, column: 72, scope: !16)
!22 = !DILocalVariable(name: "i", scope: !23, file: !17, line: 26, type: !24)
!23 = distinct !DILexicalBlock(scope: !16, file: !17, line: 25, column: 5)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !25)
!25 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!26 = !DILocation(line: 26, column: 16, scope: !23)
!27 = !DILocalVariable(name: "dest", scope: !23, file: !17, line: 27, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 27, column: 17, scope: !23)
!32 = !DILocation(line: 28, column: 17, scope: !23)
!33 = !DILocation(line: 28, column: 9, scope: !23)
!34 = !DILocation(line: 29, column: 9, scope: !23)
!35 = !DILocation(line: 29, column: 21, scope: !23)
!36 = !DILocation(line: 31, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !23, file: !17, line: 31, column: 9)
!38 = !DILocation(line: 31, column: 14, scope: !37)
!39 = !DILocation(line: 31, column: 21, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !17, line: 31, column: 9)
!41 = !DILocation(line: 31, column: 23, scope: !40)
!42 = !DILocation(line: 31, column: 9, scope: !37)
!43 = !DILocation(line: 33, column: 23, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !17, line: 32, column: 9)
!45 = !DILocation(line: 33, column: 28, scope: !44)
!46 = !DILocation(line: 33, column: 18, scope: !44)
!47 = !DILocation(line: 33, column: 13, scope: !44)
!48 = !DILocation(line: 33, column: 21, scope: !44)
!49 = !DILocation(line: 34, column: 9, scope: !44)
!50 = !DILocation(line: 31, column: 31, scope: !40)
!51 = !DILocation(line: 31, column: 9, scope: !40)
!52 = distinct !{!52, !42, !53, !54}
!53 = !DILocation(line: 34, column: 9, scope: !37)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocation(line: 36, column: 9, scope: !23)
!56 = !DILocation(line: 36, column: 21, scope: !23)
!57 = !DILocation(line: 37, column: 20, scope: !23)
!58 = !DILocation(line: 37, column: 9, scope: !23)
!59 = !DILocation(line: 41, column: 1, scope: !16)
!60 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_loop_41_bad", scope: !17, file: !17, line: 43, type: !61, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{null}
!63 = !DILocalVariable(name: "data", scope: !60, file: !17, line: 45, type: !4)
!64 = !DILocation(line: 45, column: 15, scope: !60)
!65 = !DILocation(line: 46, column: 10, scope: !60)
!66 = !DILocalVariable(name: "dataBuffer", scope: !67, file: !17, line: 48, type: !4)
!67 = distinct !DILexicalBlock(scope: !60, file: !17, line: 47, column: 5)
!68 = !DILocation(line: 48, column: 19, scope: !67)
!69 = !DILocation(line: 48, column: 43, scope: !67)
!70 = !DILocation(line: 48, column: 32, scope: !67)
!71 = !DILocation(line: 49, column: 13, scope: !72)
!72 = distinct !DILexicalBlock(scope: !67, file: !17, line: 49, column: 13)
!73 = !DILocation(line: 49, column: 24, scope: !72)
!74 = !DILocation(line: 49, column: 13, scope: !67)
!75 = !DILocation(line: 49, column: 34, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !17, line: 49, column: 33)
!77 = !DILocation(line: 50, column: 17, scope: !67)
!78 = !DILocation(line: 50, column: 9, scope: !67)
!79 = !DILocation(line: 51, column: 9, scope: !67)
!80 = !DILocation(line: 51, column: 27, scope: !67)
!81 = !DILocation(line: 53, column: 16, scope: !67)
!82 = !DILocation(line: 53, column: 27, scope: !67)
!83 = !DILocation(line: 53, column: 14, scope: !67)
!84 = !DILocation(line: 55, column: 61, scope: !60)
!85 = !DILocation(line: 55, column: 5, scope: !60)
!86 = !DILocation(line: 56, column: 1, scope: !60)
!87 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_loop_41_goodG2BSink", scope: !17, file: !17, line: 62, type: !18, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", arg: 1, scope: !87, file: !17, line: 62, type: !4)
!89 = !DILocation(line: 62, column: 76, scope: !87)
!90 = !DILocalVariable(name: "i", scope: !91, file: !17, line: 65, type: !24)
!91 = distinct !DILexicalBlock(scope: !87, file: !17, line: 64, column: 5)
!92 = !DILocation(line: 65, column: 16, scope: !91)
!93 = !DILocalVariable(name: "dest", scope: !91, file: !17, line: 66, type: !28)
!94 = !DILocation(line: 66, column: 17, scope: !91)
!95 = !DILocation(line: 67, column: 17, scope: !91)
!96 = !DILocation(line: 67, column: 9, scope: !91)
!97 = !DILocation(line: 68, column: 9, scope: !91)
!98 = !DILocation(line: 68, column: 21, scope: !91)
!99 = !DILocation(line: 70, column: 16, scope: !100)
!100 = distinct !DILexicalBlock(scope: !91, file: !17, line: 70, column: 9)
!101 = !DILocation(line: 70, column: 14, scope: !100)
!102 = !DILocation(line: 70, column: 21, scope: !103)
!103 = distinct !DILexicalBlock(scope: !100, file: !17, line: 70, column: 9)
!104 = !DILocation(line: 70, column: 23, scope: !103)
!105 = !DILocation(line: 70, column: 9, scope: !100)
!106 = !DILocation(line: 72, column: 23, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !17, line: 71, column: 9)
!108 = !DILocation(line: 72, column: 28, scope: !107)
!109 = !DILocation(line: 72, column: 18, scope: !107)
!110 = !DILocation(line: 72, column: 13, scope: !107)
!111 = !DILocation(line: 72, column: 21, scope: !107)
!112 = !DILocation(line: 73, column: 9, scope: !107)
!113 = !DILocation(line: 70, column: 31, scope: !103)
!114 = !DILocation(line: 70, column: 9, scope: !103)
!115 = distinct !{!115, !105, !116, !54}
!116 = !DILocation(line: 73, column: 9, scope: !100)
!117 = !DILocation(line: 75, column: 9, scope: !91)
!118 = !DILocation(line: 75, column: 21, scope: !91)
!119 = !DILocation(line: 76, column: 20, scope: !91)
!120 = !DILocation(line: 76, column: 9, scope: !91)
!121 = !DILocation(line: 80, column: 1, scope: !87)
!122 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_loop_41_good", scope: !17, file: !17, line: 98, type: !61, scopeLine: 99, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!123 = !DILocation(line: 100, column: 5, scope: !122)
!124 = !DILocation(line: 101, column: 1, scope: !122)
!125 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 113, type: !126, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!126 = !DISubroutineType(types: !127)
!127 = !{!7, !7, !128}
!128 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !129, size: 64)
!129 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !130, size: 64)
!130 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!131 = !DILocalVariable(name: "argc", arg: 1, scope: !125, file: !17, line: 113, type: !7)
!132 = !DILocation(line: 113, column: 14, scope: !125)
!133 = !DILocalVariable(name: "argv", arg: 2, scope: !125, file: !17, line: 113, type: !128)
!134 = !DILocation(line: 113, column: 27, scope: !125)
!135 = !DILocation(line: 116, column: 22, scope: !125)
!136 = !DILocation(line: 116, column: 12, scope: !125)
!137 = !DILocation(line: 116, column: 5, scope: !125)
!138 = !DILocation(line: 118, column: 5, scope: !125)
!139 = !DILocation(line: 119, column: 5, scope: !125)
!140 = !DILocation(line: 120, column: 5, scope: !125)
!141 = !DILocation(line: 123, column: 5, scope: !125)
!142 = !DILocation(line: 124, column: 5, scope: !125)
!143 = !DILocation(line: 125, column: 5, scope: !125)
!144 = !DILocation(line: 127, column: 5, scope: !125)
!145 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 83, type: !61, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!146 = !DILocalVariable(name: "data", scope: !145, file: !17, line: 85, type: !4)
!147 = !DILocation(line: 85, column: 15, scope: !145)
!148 = !DILocation(line: 86, column: 10, scope: !145)
!149 = !DILocalVariable(name: "dataBuffer", scope: !150, file: !17, line: 88, type: !4)
!150 = distinct !DILexicalBlock(scope: !145, file: !17, line: 87, column: 5)
!151 = !DILocation(line: 88, column: 19, scope: !150)
!152 = !DILocation(line: 88, column: 43, scope: !150)
!153 = !DILocation(line: 88, column: 32, scope: !150)
!154 = !DILocation(line: 89, column: 13, scope: !155)
!155 = distinct !DILexicalBlock(scope: !150, file: !17, line: 89, column: 13)
!156 = !DILocation(line: 89, column: 24, scope: !155)
!157 = !DILocation(line: 89, column: 13, scope: !150)
!158 = !DILocation(line: 89, column: 34, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !17, line: 89, column: 33)
!160 = !DILocation(line: 90, column: 17, scope: !150)
!161 = !DILocation(line: 90, column: 9, scope: !150)
!162 = !DILocation(line: 91, column: 9, scope: !150)
!163 = !DILocation(line: 91, column: 27, scope: !150)
!164 = !DILocation(line: 93, column: 16, scope: !150)
!165 = !DILocation(line: 93, column: 14, scope: !150)
!166 = !DILocation(line: 95, column: 65, scope: !145)
!167 = !DILocation(line: 95, column: 5, scope: !145)
!168 = !DILocation(line: 96, column: 1, scope: !145)
