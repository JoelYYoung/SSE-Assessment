; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_08.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_08_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call i32 @staticReturnsTrue(), !dbg !23
  %tobool = icmp ne i32 %call, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.end4, !dbg !25

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !29
  %call1 = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !30
  %0 = bitcast i8* %call1 to i32*, !dbg !31
  store i32* %0, i32** %dataBuffer, align 8, !dbg !29
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %cmp = icmp eq i32* %1, null, !dbg !34
  br i1 %cmp, label %if.then2, label %if.end, !dbg !35

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !38
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !39
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !42
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !43
  store i32* %add.ptr, i32** %data, align 8, !dbg !44
  br label %if.end4, !dbg !45

if.end4:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !46, metadata !DIExpression()), !dbg !51
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !52
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !53
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !54
  store i32 0, i32* %arrayidx6, align 4, !dbg !55
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !56
  %5 = load i32*, i32** %data, align 8, !dbg !57
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !58
  %call9 = call i64 @wcslen(i32* %arraydecay8) #8, !dbg !59
  %call10 = call i32* @wcsncpy(i32* %arraydecay7, i32* %5, i64 %call9) #6, !dbg !60
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !61
  store i32 0, i32* %arrayidx11, align 4, !dbg !62
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !63
  call void @printWLine(i32* %arraydecay12), !dbg !64
  ret void, !dbg !65
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
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_08_good() #0 !dbg !66 {
entry:
  call void @goodG2B1(), !dbg !67
  call void @goodG2B2(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !70 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call i64 @time(i64* null) #6, !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 %conv) #6, !dbg !82
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_08_good(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_08_bad(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !90 {
entry:
  ret i32 1, !dbg !93
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !94 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !95, metadata !DIExpression()), !dbg !96
  store i32* null, i32** %data, align 8, !dbg !97
  %call = call i32 @staticReturnsFalse(), !dbg !98
  %tobool = icmp ne i32 %call, 0, !dbg !98
  br i1 %tobool, label %if.then, label %if.else, !dbg !100

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !101
  br label %if.end4, !dbg !103

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !104, metadata !DIExpression()), !dbg !107
  %call1 = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !108
  %0 = bitcast i8* %call1 to i32*, !dbg !109
  store i32* %0, i32** %dataBuffer, align 8, !dbg !107
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !110
  %cmp = icmp eq i32* %1, null, !dbg !112
  br i1 %cmp, label %if.then2, label %if.end, !dbg !113

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !114
  unreachable, !dbg !114

if.end:                                           ; preds = %if.else
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !116
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !117
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !118
  store i32 0, i32* %arrayidx, align 4, !dbg !119
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !120
  store i32* %4, i32** %data, align 8, !dbg !121
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !122, metadata !DIExpression()), !dbg !124
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !125
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !126
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !127
  store i32 0, i32* %arrayidx6, align 4, !dbg !128
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !129
  %5 = load i32*, i32** %data, align 8, !dbg !130
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !131
  %call9 = call i64 @wcslen(i32* %arraydecay8) #8, !dbg !132
  %call10 = call i32* @wcsncpy(i32* %arraydecay7, i32* %5, i64 %call9) #6, !dbg !133
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !134
  store i32 0, i32* %arrayidx11, align 4, !dbg !135
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !136
  call void @printWLine(i32* %arraydecay12), !dbg !137
  ret void, !dbg !138
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !139 {
entry:
  ret i32 0, !dbg !140
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !141 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !142, metadata !DIExpression()), !dbg !143
  store i32* null, i32** %data, align 8, !dbg !144
  %call = call i32 @staticReturnsTrue(), !dbg !145
  %tobool = icmp ne i32 %call, 0, !dbg !145
  br i1 %tobool, label %if.then, label %if.end4, !dbg !147

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !148, metadata !DIExpression()), !dbg !151
  %call1 = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !152
  %0 = bitcast i8* %call1 to i32*, !dbg !153
  store i32* %0, i32** %dataBuffer, align 8, !dbg !151
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !154
  %cmp = icmp eq i32* %1, null, !dbg !156
  br i1 %cmp, label %if.then2, label %if.end, !dbg !157

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !158
  unreachable, !dbg !158

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !160
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !161
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !162
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !162
  store i32 0, i32* %arrayidx, align 4, !dbg !163
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !164
  store i32* %4, i32** %data, align 8, !dbg !165
  br label %if.end4, !dbg !166

if.end4:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !167, metadata !DIExpression()), !dbg !169
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !170
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !171
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !172
  store i32 0, i32* %arrayidx6, align 4, !dbg !173
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !174
  %5 = load i32*, i32** %data, align 8, !dbg !175
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !176
  %call9 = call i64 @wcslen(i32* %arraydecay8) #8, !dbg !177
  %call10 = call i32* @wcsncpy(i32* %arraydecay7, i32* %5, i64 %call9) #6, !dbg !178
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !179
  store i32 0, i32* %arrayidx11, align 4, !dbg !180
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !181
  call void @printWLine(i32* %arraydecay12), !dbg !182
  ret void, !dbg !183
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_ncpy_08_bad", scope: !17, file: !17, line: 37, type: !18, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_08.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 39, type: !4)
!21 = !DILocation(line: 39, column: 15, scope: !16)
!22 = !DILocation(line: 40, column: 10, scope: !16)
!23 = !DILocation(line: 41, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 41, column: 8)
!25 = !DILocation(line: 41, column: 8, scope: !16)
!26 = !DILocalVariable(name: "dataBuffer", scope: !27, file: !17, line: 44, type: !4)
!27 = distinct !DILexicalBlock(scope: !28, file: !17, line: 43, column: 9)
!28 = distinct !DILexicalBlock(scope: !24, file: !17, line: 42, column: 5)
!29 = !DILocation(line: 44, column: 23, scope: !27)
!30 = !DILocation(line: 44, column: 47, scope: !27)
!31 = !DILocation(line: 44, column: 36, scope: !27)
!32 = !DILocation(line: 45, column: 17, scope: !33)
!33 = distinct !DILexicalBlock(scope: !27, file: !17, line: 45, column: 17)
!34 = !DILocation(line: 45, column: 28, scope: !33)
!35 = !DILocation(line: 45, column: 17, scope: !27)
!36 = !DILocation(line: 45, column: 38, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !17, line: 45, column: 37)
!38 = !DILocation(line: 46, column: 21, scope: !27)
!39 = !DILocation(line: 46, column: 13, scope: !27)
!40 = !DILocation(line: 47, column: 13, scope: !27)
!41 = !DILocation(line: 47, column: 31, scope: !27)
!42 = !DILocation(line: 49, column: 20, scope: !27)
!43 = !DILocation(line: 49, column: 31, scope: !27)
!44 = !DILocation(line: 49, column: 18, scope: !27)
!45 = !DILocation(line: 51, column: 5, scope: !28)
!46 = !DILocalVariable(name: "dest", scope: !47, file: !17, line: 53, type: !48)
!47 = distinct !DILexicalBlock(scope: !16, file: !17, line: 52, column: 5)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 100)
!51 = !DILocation(line: 53, column: 17, scope: !47)
!52 = !DILocation(line: 54, column: 17, scope: !47)
!53 = !DILocation(line: 54, column: 9, scope: !47)
!54 = !DILocation(line: 55, column: 9, scope: !47)
!55 = !DILocation(line: 55, column: 21, scope: !47)
!56 = !DILocation(line: 57, column: 17, scope: !47)
!57 = !DILocation(line: 57, column: 23, scope: !47)
!58 = !DILocation(line: 57, column: 36, scope: !47)
!59 = !DILocation(line: 57, column: 29, scope: !47)
!60 = !DILocation(line: 57, column: 9, scope: !47)
!61 = !DILocation(line: 59, column: 9, scope: !47)
!62 = !DILocation(line: 59, column: 21, scope: !47)
!63 = !DILocation(line: 60, column: 20, scope: !47)
!64 = !DILocation(line: 60, column: 9, scope: !47)
!65 = !DILocation(line: 64, column: 1, scope: !16)
!66 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_ncpy_08_good", scope: !17, file: !17, line: 135, type: !18, scopeLine: 136, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocation(line: 137, column: 5, scope: !66)
!68 = !DILocation(line: 138, column: 5, scope: !66)
!69 = !DILocation(line: 139, column: 1, scope: !66)
!70 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 151, type: !71, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{!7, !7, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !17, line: 151, type: !7)
!77 = !DILocation(line: 151, column: 14, scope: !70)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !17, line: 151, type: !73)
!79 = !DILocation(line: 151, column: 27, scope: !70)
!80 = !DILocation(line: 154, column: 22, scope: !70)
!81 = !DILocation(line: 154, column: 12, scope: !70)
!82 = !DILocation(line: 154, column: 5, scope: !70)
!83 = !DILocation(line: 156, column: 5, scope: !70)
!84 = !DILocation(line: 157, column: 5, scope: !70)
!85 = !DILocation(line: 158, column: 5, scope: !70)
!86 = !DILocation(line: 161, column: 5, scope: !70)
!87 = !DILocation(line: 162, column: 5, scope: !70)
!88 = !DILocation(line: 163, column: 5, scope: !70)
!89 = !DILocation(line: 165, column: 5, scope: !70)
!90 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !17, file: !17, line: 25, type: !91, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DISubroutineType(types: !92)
!92 = !{!7}
!93 = !DILocation(line: 27, column: 5, scope: !90)
!94 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 71, type: !18, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !17, line: 73, type: !4)
!96 = !DILocation(line: 73, column: 15, scope: !94)
!97 = !DILocation(line: 74, column: 10, scope: !94)
!98 = !DILocation(line: 75, column: 8, scope: !99)
!99 = distinct !DILexicalBlock(scope: !94, file: !17, line: 75, column: 8)
!100 = !DILocation(line: 75, column: 8, scope: !94)
!101 = !DILocation(line: 78, column: 9, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !17, line: 76, column: 5)
!103 = !DILocation(line: 79, column: 5, scope: !102)
!104 = !DILocalVariable(name: "dataBuffer", scope: !105, file: !17, line: 83, type: !4)
!105 = distinct !DILexicalBlock(scope: !106, file: !17, line: 82, column: 9)
!106 = distinct !DILexicalBlock(scope: !99, file: !17, line: 81, column: 5)
!107 = !DILocation(line: 83, column: 23, scope: !105)
!108 = !DILocation(line: 83, column: 47, scope: !105)
!109 = !DILocation(line: 83, column: 36, scope: !105)
!110 = !DILocation(line: 84, column: 17, scope: !111)
!111 = distinct !DILexicalBlock(scope: !105, file: !17, line: 84, column: 17)
!112 = !DILocation(line: 84, column: 28, scope: !111)
!113 = !DILocation(line: 84, column: 17, scope: !105)
!114 = !DILocation(line: 84, column: 38, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !17, line: 84, column: 37)
!116 = !DILocation(line: 85, column: 21, scope: !105)
!117 = !DILocation(line: 85, column: 13, scope: !105)
!118 = !DILocation(line: 86, column: 13, scope: !105)
!119 = !DILocation(line: 86, column: 31, scope: !105)
!120 = !DILocation(line: 88, column: 20, scope: !105)
!121 = !DILocation(line: 88, column: 18, scope: !105)
!122 = !DILocalVariable(name: "dest", scope: !123, file: !17, line: 92, type: !48)
!123 = distinct !DILexicalBlock(scope: !94, file: !17, line: 91, column: 5)
!124 = !DILocation(line: 92, column: 17, scope: !123)
!125 = !DILocation(line: 93, column: 17, scope: !123)
!126 = !DILocation(line: 93, column: 9, scope: !123)
!127 = !DILocation(line: 94, column: 9, scope: !123)
!128 = !DILocation(line: 94, column: 21, scope: !123)
!129 = !DILocation(line: 96, column: 17, scope: !123)
!130 = !DILocation(line: 96, column: 23, scope: !123)
!131 = !DILocation(line: 96, column: 36, scope: !123)
!132 = !DILocation(line: 96, column: 29, scope: !123)
!133 = !DILocation(line: 96, column: 9, scope: !123)
!134 = !DILocation(line: 98, column: 9, scope: !123)
!135 = !DILocation(line: 98, column: 21, scope: !123)
!136 = !DILocation(line: 99, column: 20, scope: !123)
!137 = !DILocation(line: 99, column: 9, scope: !123)
!138 = !DILocation(line: 103, column: 1, scope: !94)
!139 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !17, file: !17, line: 30, type: !91, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!140 = !DILocation(line: 32, column: 5, scope: !139)
!141 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 106, type: !18, scopeLine: 107, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!142 = !DILocalVariable(name: "data", scope: !141, file: !17, line: 108, type: !4)
!143 = !DILocation(line: 108, column: 15, scope: !141)
!144 = !DILocation(line: 109, column: 10, scope: !141)
!145 = !DILocation(line: 110, column: 8, scope: !146)
!146 = distinct !DILexicalBlock(scope: !141, file: !17, line: 110, column: 8)
!147 = !DILocation(line: 110, column: 8, scope: !141)
!148 = !DILocalVariable(name: "dataBuffer", scope: !149, file: !17, line: 113, type: !4)
!149 = distinct !DILexicalBlock(scope: !150, file: !17, line: 112, column: 9)
!150 = distinct !DILexicalBlock(scope: !146, file: !17, line: 111, column: 5)
!151 = !DILocation(line: 113, column: 23, scope: !149)
!152 = !DILocation(line: 113, column: 47, scope: !149)
!153 = !DILocation(line: 113, column: 36, scope: !149)
!154 = !DILocation(line: 114, column: 17, scope: !155)
!155 = distinct !DILexicalBlock(scope: !149, file: !17, line: 114, column: 17)
!156 = !DILocation(line: 114, column: 28, scope: !155)
!157 = !DILocation(line: 114, column: 17, scope: !149)
!158 = !DILocation(line: 114, column: 38, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !17, line: 114, column: 37)
!160 = !DILocation(line: 115, column: 21, scope: !149)
!161 = !DILocation(line: 115, column: 13, scope: !149)
!162 = !DILocation(line: 116, column: 13, scope: !149)
!163 = !DILocation(line: 116, column: 31, scope: !149)
!164 = !DILocation(line: 118, column: 20, scope: !149)
!165 = !DILocation(line: 118, column: 18, scope: !149)
!166 = !DILocation(line: 120, column: 5, scope: !150)
!167 = !DILocalVariable(name: "dest", scope: !168, file: !17, line: 122, type: !48)
!168 = distinct !DILexicalBlock(scope: !141, file: !17, line: 121, column: 5)
!169 = !DILocation(line: 122, column: 17, scope: !168)
!170 = !DILocation(line: 123, column: 17, scope: !168)
!171 = !DILocation(line: 123, column: 9, scope: !168)
!172 = !DILocation(line: 124, column: 9, scope: !168)
!173 = !DILocation(line: 124, column: 21, scope: !168)
!174 = !DILocation(line: 126, column: 17, scope: !168)
!175 = !DILocation(line: 126, column: 23, scope: !168)
!176 = !DILocation(line: 126, column: 36, scope: !168)
!177 = !DILocation(line: 126, column: 29, scope: !168)
!178 = !DILocation(line: 126, column: 9, scope: !168)
!179 = !DILocation(line: 128, column: 9, scope: !168)
!180 = !DILocation(line: 128, column: 21, scope: !168)
!181 = !DILocation(line: 129, column: 20, scope: !168)
!182 = !DILocation(line: 129, column: 9, scope: !168)
!183 = !DILocation(line: 133, column: 1, scope: !141)
