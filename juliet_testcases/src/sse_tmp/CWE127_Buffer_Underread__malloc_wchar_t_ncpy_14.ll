; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_14.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_14_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %0 = load i32, i32* @globalFive, align 4, !dbg !23
  %cmp = icmp eq i32 %0, 5, !dbg !25
  br i1 %cmp, label %if.then, label %if.end4, !dbg !26

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !27, metadata !DIExpression()), !dbg !30
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !31
  %1 = bitcast i8* %call to i32*, !dbg !32
  store i32* %1, i32** %dataBuffer, align 8, !dbg !30
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !33
  %cmp1 = icmp eq i32* %2, null, !dbg !35
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !36

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !39
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !40
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !43
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 -8, !dbg !44
  store i32* %add.ptr, i32** %data, align 8, !dbg !45
  br label %if.end4, !dbg !46

if.end4:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !47, metadata !DIExpression()), !dbg !52
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !53
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !54
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !55
  store i32 0, i32* %arrayidx6, align 4, !dbg !56
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !57
  %6 = load i32*, i32** %data, align 8, !dbg !58
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !59
  %call9 = call i64 @wcslen(i32* %arraydecay8) #8, !dbg !60
  %call10 = call i32* @wcsncpy(i32* %arraydecay7, i32* %6, i64 %call9) #6, !dbg !61
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !62
  store i32 0, i32* %arrayidx11, align 4, !dbg !63
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !64
  call void @printWLine(i32* %arraydecay12), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_14_good() #0 !dbg !67 {
entry:
  call void @goodG2B1(), !dbg !68
  call void @goodG2B2(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* null) #6, !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 %conv) #6, !dbg !83
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_14_good(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_14_bad(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !91 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !92, metadata !DIExpression()), !dbg !93
  store i32* null, i32** %data, align 8, !dbg !94
  %0 = load i32, i32* @globalFive, align 4, !dbg !95
  %cmp = icmp ne i32 %0, 5, !dbg !97
  br i1 %cmp, label %if.then, label %if.else, !dbg !98

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !99
  br label %if.end4, !dbg !101

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !102, metadata !DIExpression()), !dbg !105
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !106
  %1 = bitcast i8* %call to i32*, !dbg !107
  store i32* %1, i32** %dataBuffer, align 8, !dbg !105
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !108
  %cmp1 = icmp eq i32* %2, null, !dbg !110
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !111

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !112
  unreachable, !dbg !112

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !114
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !115
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !116
  store i32 0, i32* %arrayidx, align 4, !dbg !117
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !118
  store i32* %5, i32** %data, align 8, !dbg !119
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !120, metadata !DIExpression()), !dbg !122
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !123
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !124
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !125
  store i32 0, i32* %arrayidx6, align 4, !dbg !126
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !127
  %6 = load i32*, i32** %data, align 8, !dbg !128
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !129
  %call9 = call i64 @wcslen(i32* %arraydecay8) #8, !dbg !130
  %call10 = call i32* @wcsncpy(i32* %arraydecay7, i32* %6, i64 %call9) #6, !dbg !131
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !132
  store i32 0, i32* %arrayidx11, align 4, !dbg !133
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !134
  call void @printWLine(i32* %arraydecay12), !dbg !135
  ret void, !dbg !136
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !137 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !138, metadata !DIExpression()), !dbg !139
  store i32* null, i32** %data, align 8, !dbg !140
  %0 = load i32, i32* @globalFive, align 4, !dbg !141
  %cmp = icmp eq i32 %0, 5, !dbg !143
  br i1 %cmp, label %if.then, label %if.end4, !dbg !144

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !145, metadata !DIExpression()), !dbg !148
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !149
  %1 = bitcast i8* %call to i32*, !dbg !150
  store i32* %1, i32** %dataBuffer, align 8, !dbg !148
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !151
  %cmp1 = icmp eq i32* %2, null, !dbg !153
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !154

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !155
  unreachable, !dbg !155

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !157
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !158
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !159
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !159
  store i32 0, i32* %arrayidx, align 4, !dbg !160
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !161
  store i32* %5, i32** %data, align 8, !dbg !162
  br label %if.end4, !dbg !163

if.end4:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !164, metadata !DIExpression()), !dbg !166
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !167
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !168
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !169
  store i32 0, i32* %arrayidx6, align 4, !dbg !170
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !171
  %6 = load i32*, i32** %data, align 8, !dbg !172
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !173
  %call9 = call i64 @wcslen(i32* %arraydecay8) #8, !dbg !174
  %call10 = call i32* @wcsncpy(i32* %arraydecay7, i32* %6, i64 %call9) #6, !dbg !175
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !176
  store i32 0, i32* %arrayidx11, align 4, !dbg !177
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !178
  call void @printWLine(i32* %arraydecay12), !dbg !179
  ret void, !dbg !180
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_14.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_ncpy_14_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_14.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 27, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 8)
!25 = !DILocation(line: 27, column: 18, scope: !24)
!26 = !DILocation(line: 27, column: 8, scope: !16)
!27 = !DILocalVariable(name: "dataBuffer", scope: !28, file: !17, line: 30, type: !4)
!28 = distinct !DILexicalBlock(scope: !29, file: !17, line: 29, column: 9)
!29 = distinct !DILexicalBlock(scope: !24, file: !17, line: 28, column: 5)
!30 = !DILocation(line: 30, column: 23, scope: !28)
!31 = !DILocation(line: 30, column: 47, scope: !28)
!32 = !DILocation(line: 30, column: 36, scope: !28)
!33 = !DILocation(line: 31, column: 17, scope: !34)
!34 = distinct !DILexicalBlock(scope: !28, file: !17, line: 31, column: 17)
!35 = !DILocation(line: 31, column: 28, scope: !34)
!36 = !DILocation(line: 31, column: 17, scope: !28)
!37 = !DILocation(line: 31, column: 38, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !17, line: 31, column: 37)
!39 = !DILocation(line: 32, column: 21, scope: !28)
!40 = !DILocation(line: 32, column: 13, scope: !28)
!41 = !DILocation(line: 33, column: 13, scope: !28)
!42 = !DILocation(line: 33, column: 31, scope: !28)
!43 = !DILocation(line: 35, column: 20, scope: !28)
!44 = !DILocation(line: 35, column: 31, scope: !28)
!45 = !DILocation(line: 35, column: 18, scope: !28)
!46 = !DILocation(line: 37, column: 5, scope: !29)
!47 = !DILocalVariable(name: "dest", scope: !48, file: !17, line: 39, type: !49)
!48 = distinct !DILexicalBlock(scope: !16, file: !17, line: 38, column: 5)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 100)
!52 = !DILocation(line: 39, column: 17, scope: !48)
!53 = !DILocation(line: 40, column: 17, scope: !48)
!54 = !DILocation(line: 40, column: 9, scope: !48)
!55 = !DILocation(line: 41, column: 9, scope: !48)
!56 = !DILocation(line: 41, column: 21, scope: !48)
!57 = !DILocation(line: 43, column: 17, scope: !48)
!58 = !DILocation(line: 43, column: 23, scope: !48)
!59 = !DILocation(line: 43, column: 36, scope: !48)
!60 = !DILocation(line: 43, column: 29, scope: !48)
!61 = !DILocation(line: 43, column: 9, scope: !48)
!62 = !DILocation(line: 45, column: 9, scope: !48)
!63 = !DILocation(line: 45, column: 21, scope: !48)
!64 = !DILocation(line: 46, column: 20, scope: !48)
!65 = !DILocation(line: 46, column: 9, scope: !48)
!66 = !DILocation(line: 50, column: 1, scope: !16)
!67 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_ncpy_14_good", scope: !17, file: !17, line: 121, type: !18, scopeLine: 122, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocation(line: 123, column: 5, scope: !67)
!69 = !DILocation(line: 124, column: 5, scope: !67)
!70 = !DILocation(line: 125, column: 1, scope: !67)
!71 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 137, type: !72, scopeLine: 138, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{!7, !7, !74}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !17, line: 137, type: !7)
!78 = !DILocation(line: 137, column: 14, scope: !71)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !17, line: 137, type: !74)
!80 = !DILocation(line: 137, column: 27, scope: !71)
!81 = !DILocation(line: 140, column: 22, scope: !71)
!82 = !DILocation(line: 140, column: 12, scope: !71)
!83 = !DILocation(line: 140, column: 5, scope: !71)
!84 = !DILocation(line: 142, column: 5, scope: !71)
!85 = !DILocation(line: 143, column: 5, scope: !71)
!86 = !DILocation(line: 144, column: 5, scope: !71)
!87 = !DILocation(line: 147, column: 5, scope: !71)
!88 = !DILocation(line: 148, column: 5, scope: !71)
!89 = !DILocation(line: 149, column: 5, scope: !71)
!90 = !DILocation(line: 151, column: 5, scope: !71)
!91 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 57, type: !18, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocalVariable(name: "data", scope: !91, file: !17, line: 59, type: !4)
!93 = !DILocation(line: 59, column: 15, scope: !91)
!94 = !DILocation(line: 60, column: 10, scope: !91)
!95 = !DILocation(line: 61, column: 8, scope: !96)
!96 = distinct !DILexicalBlock(scope: !91, file: !17, line: 61, column: 8)
!97 = !DILocation(line: 61, column: 18, scope: !96)
!98 = !DILocation(line: 61, column: 8, scope: !91)
!99 = !DILocation(line: 64, column: 9, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !17, line: 62, column: 5)
!101 = !DILocation(line: 65, column: 5, scope: !100)
!102 = !DILocalVariable(name: "dataBuffer", scope: !103, file: !17, line: 69, type: !4)
!103 = distinct !DILexicalBlock(scope: !104, file: !17, line: 68, column: 9)
!104 = distinct !DILexicalBlock(scope: !96, file: !17, line: 67, column: 5)
!105 = !DILocation(line: 69, column: 23, scope: !103)
!106 = !DILocation(line: 69, column: 47, scope: !103)
!107 = !DILocation(line: 69, column: 36, scope: !103)
!108 = !DILocation(line: 70, column: 17, scope: !109)
!109 = distinct !DILexicalBlock(scope: !103, file: !17, line: 70, column: 17)
!110 = !DILocation(line: 70, column: 28, scope: !109)
!111 = !DILocation(line: 70, column: 17, scope: !103)
!112 = !DILocation(line: 70, column: 38, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !17, line: 70, column: 37)
!114 = !DILocation(line: 71, column: 21, scope: !103)
!115 = !DILocation(line: 71, column: 13, scope: !103)
!116 = !DILocation(line: 72, column: 13, scope: !103)
!117 = !DILocation(line: 72, column: 31, scope: !103)
!118 = !DILocation(line: 74, column: 20, scope: !103)
!119 = !DILocation(line: 74, column: 18, scope: !103)
!120 = !DILocalVariable(name: "dest", scope: !121, file: !17, line: 78, type: !49)
!121 = distinct !DILexicalBlock(scope: !91, file: !17, line: 77, column: 5)
!122 = !DILocation(line: 78, column: 17, scope: !121)
!123 = !DILocation(line: 79, column: 17, scope: !121)
!124 = !DILocation(line: 79, column: 9, scope: !121)
!125 = !DILocation(line: 80, column: 9, scope: !121)
!126 = !DILocation(line: 80, column: 21, scope: !121)
!127 = !DILocation(line: 82, column: 17, scope: !121)
!128 = !DILocation(line: 82, column: 23, scope: !121)
!129 = !DILocation(line: 82, column: 36, scope: !121)
!130 = !DILocation(line: 82, column: 29, scope: !121)
!131 = !DILocation(line: 82, column: 9, scope: !121)
!132 = !DILocation(line: 84, column: 9, scope: !121)
!133 = !DILocation(line: 84, column: 21, scope: !121)
!134 = !DILocation(line: 85, column: 20, scope: !121)
!135 = !DILocation(line: 85, column: 9, scope: !121)
!136 = !DILocation(line: 89, column: 1, scope: !91)
!137 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 92, type: !18, scopeLine: 93, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!138 = !DILocalVariable(name: "data", scope: !137, file: !17, line: 94, type: !4)
!139 = !DILocation(line: 94, column: 15, scope: !137)
!140 = !DILocation(line: 95, column: 10, scope: !137)
!141 = !DILocation(line: 96, column: 8, scope: !142)
!142 = distinct !DILexicalBlock(scope: !137, file: !17, line: 96, column: 8)
!143 = !DILocation(line: 96, column: 18, scope: !142)
!144 = !DILocation(line: 96, column: 8, scope: !137)
!145 = !DILocalVariable(name: "dataBuffer", scope: !146, file: !17, line: 99, type: !4)
!146 = distinct !DILexicalBlock(scope: !147, file: !17, line: 98, column: 9)
!147 = distinct !DILexicalBlock(scope: !142, file: !17, line: 97, column: 5)
!148 = !DILocation(line: 99, column: 23, scope: !146)
!149 = !DILocation(line: 99, column: 47, scope: !146)
!150 = !DILocation(line: 99, column: 36, scope: !146)
!151 = !DILocation(line: 100, column: 17, scope: !152)
!152 = distinct !DILexicalBlock(scope: !146, file: !17, line: 100, column: 17)
!153 = !DILocation(line: 100, column: 28, scope: !152)
!154 = !DILocation(line: 100, column: 17, scope: !146)
!155 = !DILocation(line: 100, column: 38, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !17, line: 100, column: 37)
!157 = !DILocation(line: 101, column: 21, scope: !146)
!158 = !DILocation(line: 101, column: 13, scope: !146)
!159 = !DILocation(line: 102, column: 13, scope: !146)
!160 = !DILocation(line: 102, column: 31, scope: !146)
!161 = !DILocation(line: 104, column: 20, scope: !146)
!162 = !DILocation(line: 104, column: 18, scope: !146)
!163 = !DILocation(line: 106, column: 5, scope: !147)
!164 = !DILocalVariable(name: "dest", scope: !165, file: !17, line: 108, type: !49)
!165 = distinct !DILexicalBlock(scope: !137, file: !17, line: 107, column: 5)
!166 = !DILocation(line: 108, column: 17, scope: !165)
!167 = !DILocation(line: 109, column: 17, scope: !165)
!168 = !DILocation(line: 109, column: 9, scope: !165)
!169 = !DILocation(line: 110, column: 9, scope: !165)
!170 = !DILocation(line: 110, column: 21, scope: !165)
!171 = !DILocation(line: 112, column: 17, scope: !165)
!172 = !DILocation(line: 112, column: 23, scope: !165)
!173 = !DILocation(line: 112, column: 36, scope: !165)
!174 = !DILocation(line: 112, column: 29, scope: !165)
!175 = !DILocation(line: 112, column: 9, scope: !165)
!176 = !DILocation(line: 114, column: 9, scope: !165)
!177 = !DILocation(line: 114, column: 21, scope: !165)
!178 = !DILocation(line: 115, column: 20, scope: !165)
!179 = !DILocation(line: 115, column: 9, scope: !165)
!180 = !DILocation(line: 119, column: 1, scope: !137)
