; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_08.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_08_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call i32 @staticReturnsTrue(), !dbg !23
  %tobool = icmp ne i32 %call, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.end4, !dbg !25

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !29
  %call1 = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !30
  %0 = bitcast i8* %call1 to i32*, !dbg !31
  store i32* %0, i32** %dataBuffer, align 8, !dbg !29
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %cmp = icmp eq i32* %1, null, !dbg !34
  br i1 %cmp, label %if.then2, label %if.end, !dbg !35

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !38
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !39
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !42
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !43
  store i32* %add.ptr, i32** %data, align 8, !dbg !44
  br label %if.end4, !dbg !45

if.end4:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !46, metadata !DIExpression()), !dbg !51
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !52
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !53
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !54
  store i32 0, i32* %arrayidx6, align 4, !dbg !55
  %5 = load i32*, i32** %data, align 8, !dbg !56
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !57
  %call8 = call i32* @wcsncpy(i32* %5, i32* %arraydecay7, i64 99) #5, !dbg !58
  %6 = load i32*, i32** %data, align 8, !dbg !59
  %arrayidx9 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !59
  store i32 0, i32* %arrayidx9, align 4, !dbg !60
  %7 = load i32*, i32** %data, align 8, !dbg !61
  call void @printWLine(i32* %7), !dbg !62
  ret void, !dbg !63
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

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_08_good() #0 !dbg !64 {
entry:
  call void @goodG2B1(), !dbg !65
  call void @goodG2B2(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* null) #5, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #5, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_08_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_08_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !88 {
entry:
  ret i32 1, !dbg !91
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !92 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !93, metadata !DIExpression()), !dbg !94
  store i32* null, i32** %data, align 8, !dbg !95
  %call = call i32 @staticReturnsFalse(), !dbg !96
  %tobool = icmp ne i32 %call, 0, !dbg !96
  br i1 %tobool, label %if.then, label %if.else, !dbg !98

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !99
  br label %if.end4, !dbg !101

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !102, metadata !DIExpression()), !dbg !105
  %call1 = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !106
  %0 = bitcast i8* %call1 to i32*, !dbg !107
  store i32* %0, i32** %dataBuffer, align 8, !dbg !105
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !108
  %cmp = icmp eq i32* %1, null, !dbg !110
  br i1 %cmp, label %if.then2, label %if.end, !dbg !111

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !112
  unreachable, !dbg !112

if.end:                                           ; preds = %if.else
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !114
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !115
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !116
  store i32 0, i32* %arrayidx, align 4, !dbg !117
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !118
  store i32* %4, i32** %data, align 8, !dbg !119
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !120, metadata !DIExpression()), !dbg !122
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !123
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !124
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !125
  store i32 0, i32* %arrayidx6, align 4, !dbg !126
  %5 = load i32*, i32** %data, align 8, !dbg !127
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !128
  %call8 = call i32* @wcsncpy(i32* %5, i32* %arraydecay7, i64 99) #5, !dbg !129
  %6 = load i32*, i32** %data, align 8, !dbg !130
  %arrayidx9 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !130
  store i32 0, i32* %arrayidx9, align 4, !dbg !131
  %7 = load i32*, i32** %data, align 8, !dbg !132
  call void @printWLine(i32* %7), !dbg !133
  ret void, !dbg !134
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !135 {
entry:
  ret i32 0, !dbg !136
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !137 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !138, metadata !DIExpression()), !dbg !139
  store i32* null, i32** %data, align 8, !dbg !140
  %call = call i32 @staticReturnsTrue(), !dbg !141
  %tobool = icmp ne i32 %call, 0, !dbg !141
  br i1 %tobool, label %if.then, label %if.end4, !dbg !143

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !144, metadata !DIExpression()), !dbg !147
  %call1 = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !148
  %0 = bitcast i8* %call1 to i32*, !dbg !149
  store i32* %0, i32** %dataBuffer, align 8, !dbg !147
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !150
  %cmp = icmp eq i32* %1, null, !dbg !152
  br i1 %cmp, label %if.then2, label %if.end, !dbg !153

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !154
  unreachable, !dbg !154

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !156
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !157
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !158
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !158
  store i32 0, i32* %arrayidx, align 4, !dbg !159
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !160
  store i32* %4, i32** %data, align 8, !dbg !161
  br label %if.end4, !dbg !162

if.end4:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !163, metadata !DIExpression()), !dbg !165
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !166
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !167
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !168
  store i32 0, i32* %arrayidx6, align 4, !dbg !169
  %5 = load i32*, i32** %data, align 8, !dbg !170
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !171
  %call8 = call i32* @wcsncpy(i32* %5, i32* %arraydecay7, i64 99) #5, !dbg !172
  %6 = load i32*, i32** %data, align 8, !dbg !173
  %arrayidx9 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !173
  store i32 0, i32* %arrayidx9, align 4, !dbg !174
  %7 = load i32*, i32** %data, align 8, !dbg !175
  call void @printWLine(i32* %7), !dbg !176
  ret void, !dbg !177
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_08_bad", scope: !17, file: !17, line: 37, type: !18, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!46 = !DILocalVariable(name: "source", scope: !47, file: !17, line: 53, type: !48)
!47 = distinct !DILexicalBlock(scope: !16, file: !17, line: 52, column: 5)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 100)
!51 = !DILocation(line: 53, column: 17, scope: !47)
!52 = !DILocation(line: 54, column: 17, scope: !47)
!53 = !DILocation(line: 54, column: 9, scope: !47)
!54 = !DILocation(line: 55, column: 9, scope: !47)
!55 = !DILocation(line: 55, column: 23, scope: !47)
!56 = !DILocation(line: 57, column: 17, scope: !47)
!57 = !DILocation(line: 57, column: 23, scope: !47)
!58 = !DILocation(line: 57, column: 9, scope: !47)
!59 = !DILocation(line: 59, column: 9, scope: !47)
!60 = !DILocation(line: 59, column: 21, scope: !47)
!61 = !DILocation(line: 60, column: 20, scope: !47)
!62 = !DILocation(line: 60, column: 9, scope: !47)
!63 = !DILocation(line: 64, column: 1, scope: !16)
!64 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_08_good", scope: !17, file: !17, line: 135, type: !18, scopeLine: 136, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 137, column: 5, scope: !64)
!66 = !DILocation(line: 138, column: 5, scope: !64)
!67 = !DILocation(line: 139, column: 1, scope: !64)
!68 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 151, type: !69, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!7, !7, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !17, line: 151, type: !7)
!75 = !DILocation(line: 151, column: 14, scope: !68)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !17, line: 151, type: !71)
!77 = !DILocation(line: 151, column: 27, scope: !68)
!78 = !DILocation(line: 154, column: 22, scope: !68)
!79 = !DILocation(line: 154, column: 12, scope: !68)
!80 = !DILocation(line: 154, column: 5, scope: !68)
!81 = !DILocation(line: 156, column: 5, scope: !68)
!82 = !DILocation(line: 157, column: 5, scope: !68)
!83 = !DILocation(line: 158, column: 5, scope: !68)
!84 = !DILocation(line: 161, column: 5, scope: !68)
!85 = !DILocation(line: 162, column: 5, scope: !68)
!86 = !DILocation(line: 163, column: 5, scope: !68)
!87 = !DILocation(line: 165, column: 5, scope: !68)
!88 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !17, file: !17, line: 25, type: !89, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DISubroutineType(types: !90)
!90 = !{!7}
!91 = !DILocation(line: 27, column: 5, scope: !88)
!92 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 71, type: !18, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "data", scope: !92, file: !17, line: 73, type: !4)
!94 = !DILocation(line: 73, column: 15, scope: !92)
!95 = !DILocation(line: 74, column: 10, scope: !92)
!96 = !DILocation(line: 75, column: 8, scope: !97)
!97 = distinct !DILexicalBlock(scope: !92, file: !17, line: 75, column: 8)
!98 = !DILocation(line: 75, column: 8, scope: !92)
!99 = !DILocation(line: 78, column: 9, scope: !100)
!100 = distinct !DILexicalBlock(scope: !97, file: !17, line: 76, column: 5)
!101 = !DILocation(line: 79, column: 5, scope: !100)
!102 = !DILocalVariable(name: "dataBuffer", scope: !103, file: !17, line: 83, type: !4)
!103 = distinct !DILexicalBlock(scope: !104, file: !17, line: 82, column: 9)
!104 = distinct !DILexicalBlock(scope: !97, file: !17, line: 81, column: 5)
!105 = !DILocation(line: 83, column: 23, scope: !103)
!106 = !DILocation(line: 83, column: 47, scope: !103)
!107 = !DILocation(line: 83, column: 36, scope: !103)
!108 = !DILocation(line: 84, column: 17, scope: !109)
!109 = distinct !DILexicalBlock(scope: !103, file: !17, line: 84, column: 17)
!110 = !DILocation(line: 84, column: 28, scope: !109)
!111 = !DILocation(line: 84, column: 17, scope: !103)
!112 = !DILocation(line: 84, column: 38, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !17, line: 84, column: 37)
!114 = !DILocation(line: 85, column: 21, scope: !103)
!115 = !DILocation(line: 85, column: 13, scope: !103)
!116 = !DILocation(line: 86, column: 13, scope: !103)
!117 = !DILocation(line: 86, column: 31, scope: !103)
!118 = !DILocation(line: 88, column: 20, scope: !103)
!119 = !DILocation(line: 88, column: 18, scope: !103)
!120 = !DILocalVariable(name: "source", scope: !121, file: !17, line: 92, type: !48)
!121 = distinct !DILexicalBlock(scope: !92, file: !17, line: 91, column: 5)
!122 = !DILocation(line: 92, column: 17, scope: !121)
!123 = !DILocation(line: 93, column: 17, scope: !121)
!124 = !DILocation(line: 93, column: 9, scope: !121)
!125 = !DILocation(line: 94, column: 9, scope: !121)
!126 = !DILocation(line: 94, column: 23, scope: !121)
!127 = !DILocation(line: 96, column: 17, scope: !121)
!128 = !DILocation(line: 96, column: 23, scope: !121)
!129 = !DILocation(line: 96, column: 9, scope: !121)
!130 = !DILocation(line: 98, column: 9, scope: !121)
!131 = !DILocation(line: 98, column: 21, scope: !121)
!132 = !DILocation(line: 99, column: 20, scope: !121)
!133 = !DILocation(line: 99, column: 9, scope: !121)
!134 = !DILocation(line: 103, column: 1, scope: !92)
!135 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !17, file: !17, line: 30, type: !89, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!136 = !DILocation(line: 32, column: 5, scope: !135)
!137 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 106, type: !18, scopeLine: 107, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!138 = !DILocalVariable(name: "data", scope: !137, file: !17, line: 108, type: !4)
!139 = !DILocation(line: 108, column: 15, scope: !137)
!140 = !DILocation(line: 109, column: 10, scope: !137)
!141 = !DILocation(line: 110, column: 8, scope: !142)
!142 = distinct !DILexicalBlock(scope: !137, file: !17, line: 110, column: 8)
!143 = !DILocation(line: 110, column: 8, scope: !137)
!144 = !DILocalVariable(name: "dataBuffer", scope: !145, file: !17, line: 113, type: !4)
!145 = distinct !DILexicalBlock(scope: !146, file: !17, line: 112, column: 9)
!146 = distinct !DILexicalBlock(scope: !142, file: !17, line: 111, column: 5)
!147 = !DILocation(line: 113, column: 23, scope: !145)
!148 = !DILocation(line: 113, column: 47, scope: !145)
!149 = !DILocation(line: 113, column: 36, scope: !145)
!150 = !DILocation(line: 114, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !145, file: !17, line: 114, column: 17)
!152 = !DILocation(line: 114, column: 28, scope: !151)
!153 = !DILocation(line: 114, column: 17, scope: !145)
!154 = !DILocation(line: 114, column: 38, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !17, line: 114, column: 37)
!156 = !DILocation(line: 115, column: 21, scope: !145)
!157 = !DILocation(line: 115, column: 13, scope: !145)
!158 = !DILocation(line: 116, column: 13, scope: !145)
!159 = !DILocation(line: 116, column: 31, scope: !145)
!160 = !DILocation(line: 118, column: 20, scope: !145)
!161 = !DILocation(line: 118, column: 18, scope: !145)
!162 = !DILocation(line: 120, column: 5, scope: !146)
!163 = !DILocalVariable(name: "source", scope: !164, file: !17, line: 122, type: !48)
!164 = distinct !DILexicalBlock(scope: !137, file: !17, line: 121, column: 5)
!165 = !DILocation(line: 122, column: 17, scope: !164)
!166 = !DILocation(line: 123, column: 17, scope: !164)
!167 = !DILocation(line: 123, column: 9, scope: !164)
!168 = !DILocation(line: 124, column: 9, scope: !164)
!169 = !DILocation(line: 124, column: 23, scope: !164)
!170 = !DILocation(line: 126, column: 17, scope: !164)
!171 = !DILocation(line: 126, column: 23, scope: !164)
!172 = !DILocation(line: 126, column: 9, scope: !164)
!173 = !DILocation(line: 128, column: 9, scope: !164)
!174 = !DILocation(line: 128, column: 21, scope: !164)
!175 = !DILocation(line: 129, column: 20, scope: !164)
!176 = !DILocation(line: 129, column: 9, scope: !164)
!177 = !DILocation(line: 133, column: 1, scope: !137)
