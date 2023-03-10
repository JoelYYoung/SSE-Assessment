; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_08.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_08_bad() #0 !dbg !16 {
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
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !46, metadata !DIExpression()), !dbg !51
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !52
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !53
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !54
  store i32 0, i32* %arrayidx6, align 4, !dbg !55
  %5 = load i32*, i32** %data, align 8, !dbg !56
  %6 = bitcast i32* %5 to i8*, !dbg !57
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !57
  %7 = bitcast i32* %arraydecay7 to i8*, !dbg !57
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 400, i1 false), !dbg !57
  %8 = load i32*, i32** %data, align 8, !dbg !58
  %arrayidx8 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !58
  store i32 0, i32* %arrayidx8, align 4, !dbg !59
  %9 = load i32*, i32** %data, align 8, !dbg !60
  call void @printWLine(i32* %9), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_08_good() #0 !dbg !63 {
entry:
  call void @goodG2B1(), !dbg !64
  call void @goodG2B2(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #6, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #6, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_08_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_08_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !87 {
entry:
  ret i32 1, !dbg !90
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !91 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !92, metadata !DIExpression()), !dbg !93
  store i32* null, i32** %data, align 8, !dbg !94
  %call = call i32 @staticReturnsFalse(), !dbg !95
  %tobool = icmp ne i32 %call, 0, !dbg !95
  br i1 %tobool, label %if.then, label %if.else, !dbg !97

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !98
  br label %if.end4, !dbg !100

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !101, metadata !DIExpression()), !dbg !104
  %call1 = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !105
  %0 = bitcast i8* %call1 to i32*, !dbg !106
  store i32* %0, i32** %dataBuffer, align 8, !dbg !104
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !107
  %cmp = icmp eq i32* %1, null, !dbg !109
  br i1 %cmp, label %if.then2, label %if.end, !dbg !110

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !111
  unreachable, !dbg !111

if.end:                                           ; preds = %if.else
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !113
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !114
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !115
  store i32 0, i32* %arrayidx, align 4, !dbg !116
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !117
  store i32* %4, i32** %data, align 8, !dbg !118
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !119, metadata !DIExpression()), !dbg !121
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !122
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !123
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !124
  store i32 0, i32* %arrayidx6, align 4, !dbg !125
  %5 = load i32*, i32** %data, align 8, !dbg !126
  %6 = bitcast i32* %5 to i8*, !dbg !127
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !127
  %7 = bitcast i32* %arraydecay7 to i8*, !dbg !127
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 400, i1 false), !dbg !127
  %8 = load i32*, i32** %data, align 8, !dbg !128
  %arrayidx8 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !128
  store i32 0, i32* %arrayidx8, align 4, !dbg !129
  %9 = load i32*, i32** %data, align 8, !dbg !130
  call void @printWLine(i32* %9), !dbg !131
  ret void, !dbg !132
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !133 {
entry:
  ret i32 0, !dbg !134
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !135 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !136, metadata !DIExpression()), !dbg !137
  store i32* null, i32** %data, align 8, !dbg !138
  %call = call i32 @staticReturnsTrue(), !dbg !139
  %tobool = icmp ne i32 %call, 0, !dbg !139
  br i1 %tobool, label %if.then, label %if.end4, !dbg !141

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !142, metadata !DIExpression()), !dbg !145
  %call1 = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !146
  %0 = bitcast i8* %call1 to i32*, !dbg !147
  store i32* %0, i32** %dataBuffer, align 8, !dbg !145
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !148
  %cmp = icmp eq i32* %1, null, !dbg !150
  br i1 %cmp, label %if.then2, label %if.end, !dbg !151

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !152
  unreachable, !dbg !152

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !154
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !155
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !156
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !156
  store i32 0, i32* %arrayidx, align 4, !dbg !157
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !158
  store i32* %4, i32** %data, align 8, !dbg !159
  br label %if.end4, !dbg !160

if.end4:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !161, metadata !DIExpression()), !dbg !163
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !164
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !165
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !166
  store i32 0, i32* %arrayidx6, align 4, !dbg !167
  %5 = load i32*, i32** %data, align 8, !dbg !168
  %6 = bitcast i32* %5 to i8*, !dbg !169
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !169
  %7 = bitcast i32* %arraydecay7 to i8*, !dbg !169
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 400, i1 false), !dbg !169
  %8 = load i32*, i32** %data, align 8, !dbg !170
  %arrayidx8 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !170
  store i32 0, i32* %arrayidx8, align 4, !dbg !171
  %9 = load i32*, i32** %data, align 8, !dbg !172
  call void @printWLine(i32* %9), !dbg !173
  ret void, !dbg !174
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_08_bad", scope: !17, file: !17, line: 37, type: !18, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!57 = !DILocation(line: 57, column: 9, scope: !47)
!58 = !DILocation(line: 59, column: 9, scope: !47)
!59 = !DILocation(line: 59, column: 21, scope: !47)
!60 = !DILocation(line: 60, column: 20, scope: !47)
!61 = !DILocation(line: 60, column: 9, scope: !47)
!62 = !DILocation(line: 64, column: 1, scope: !16)
!63 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_08_good", scope: !17, file: !17, line: 135, type: !18, scopeLine: 136, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 137, column: 5, scope: !63)
!65 = !DILocation(line: 138, column: 5, scope: !63)
!66 = !DILocation(line: 139, column: 1, scope: !63)
!67 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 151, type: !68, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!7, !7, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !17, line: 151, type: !7)
!74 = !DILocation(line: 151, column: 14, scope: !67)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !17, line: 151, type: !70)
!76 = !DILocation(line: 151, column: 27, scope: !67)
!77 = !DILocation(line: 154, column: 22, scope: !67)
!78 = !DILocation(line: 154, column: 12, scope: !67)
!79 = !DILocation(line: 154, column: 5, scope: !67)
!80 = !DILocation(line: 156, column: 5, scope: !67)
!81 = !DILocation(line: 157, column: 5, scope: !67)
!82 = !DILocation(line: 158, column: 5, scope: !67)
!83 = !DILocation(line: 161, column: 5, scope: !67)
!84 = !DILocation(line: 162, column: 5, scope: !67)
!85 = !DILocation(line: 163, column: 5, scope: !67)
!86 = !DILocation(line: 165, column: 5, scope: !67)
!87 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !17, file: !17, line: 25, type: !88, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DISubroutineType(types: !89)
!89 = !{!7}
!90 = !DILocation(line: 27, column: 5, scope: !87)
!91 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 71, type: !18, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocalVariable(name: "data", scope: !91, file: !17, line: 73, type: !4)
!93 = !DILocation(line: 73, column: 15, scope: !91)
!94 = !DILocation(line: 74, column: 10, scope: !91)
!95 = !DILocation(line: 75, column: 8, scope: !96)
!96 = distinct !DILexicalBlock(scope: !91, file: !17, line: 75, column: 8)
!97 = !DILocation(line: 75, column: 8, scope: !91)
!98 = !DILocation(line: 78, column: 9, scope: !99)
!99 = distinct !DILexicalBlock(scope: !96, file: !17, line: 76, column: 5)
!100 = !DILocation(line: 79, column: 5, scope: !99)
!101 = !DILocalVariable(name: "dataBuffer", scope: !102, file: !17, line: 83, type: !4)
!102 = distinct !DILexicalBlock(scope: !103, file: !17, line: 82, column: 9)
!103 = distinct !DILexicalBlock(scope: !96, file: !17, line: 81, column: 5)
!104 = !DILocation(line: 83, column: 23, scope: !102)
!105 = !DILocation(line: 83, column: 47, scope: !102)
!106 = !DILocation(line: 83, column: 36, scope: !102)
!107 = !DILocation(line: 84, column: 17, scope: !108)
!108 = distinct !DILexicalBlock(scope: !102, file: !17, line: 84, column: 17)
!109 = !DILocation(line: 84, column: 28, scope: !108)
!110 = !DILocation(line: 84, column: 17, scope: !102)
!111 = !DILocation(line: 84, column: 38, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !17, line: 84, column: 37)
!113 = !DILocation(line: 85, column: 21, scope: !102)
!114 = !DILocation(line: 85, column: 13, scope: !102)
!115 = !DILocation(line: 86, column: 13, scope: !102)
!116 = !DILocation(line: 86, column: 31, scope: !102)
!117 = !DILocation(line: 88, column: 20, scope: !102)
!118 = !DILocation(line: 88, column: 18, scope: !102)
!119 = !DILocalVariable(name: "source", scope: !120, file: !17, line: 92, type: !48)
!120 = distinct !DILexicalBlock(scope: !91, file: !17, line: 91, column: 5)
!121 = !DILocation(line: 92, column: 17, scope: !120)
!122 = !DILocation(line: 93, column: 17, scope: !120)
!123 = !DILocation(line: 93, column: 9, scope: !120)
!124 = !DILocation(line: 94, column: 9, scope: !120)
!125 = !DILocation(line: 94, column: 23, scope: !120)
!126 = !DILocation(line: 96, column: 17, scope: !120)
!127 = !DILocation(line: 96, column: 9, scope: !120)
!128 = !DILocation(line: 98, column: 9, scope: !120)
!129 = !DILocation(line: 98, column: 21, scope: !120)
!130 = !DILocation(line: 99, column: 20, scope: !120)
!131 = !DILocation(line: 99, column: 9, scope: !120)
!132 = !DILocation(line: 103, column: 1, scope: !91)
!133 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !17, file: !17, line: 30, type: !88, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!134 = !DILocation(line: 32, column: 5, scope: !133)
!135 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 106, type: !18, scopeLine: 107, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!136 = !DILocalVariable(name: "data", scope: !135, file: !17, line: 108, type: !4)
!137 = !DILocation(line: 108, column: 15, scope: !135)
!138 = !DILocation(line: 109, column: 10, scope: !135)
!139 = !DILocation(line: 110, column: 8, scope: !140)
!140 = distinct !DILexicalBlock(scope: !135, file: !17, line: 110, column: 8)
!141 = !DILocation(line: 110, column: 8, scope: !135)
!142 = !DILocalVariable(name: "dataBuffer", scope: !143, file: !17, line: 113, type: !4)
!143 = distinct !DILexicalBlock(scope: !144, file: !17, line: 112, column: 9)
!144 = distinct !DILexicalBlock(scope: !140, file: !17, line: 111, column: 5)
!145 = !DILocation(line: 113, column: 23, scope: !143)
!146 = !DILocation(line: 113, column: 47, scope: !143)
!147 = !DILocation(line: 113, column: 36, scope: !143)
!148 = !DILocation(line: 114, column: 17, scope: !149)
!149 = distinct !DILexicalBlock(scope: !143, file: !17, line: 114, column: 17)
!150 = !DILocation(line: 114, column: 28, scope: !149)
!151 = !DILocation(line: 114, column: 17, scope: !143)
!152 = !DILocation(line: 114, column: 38, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !17, line: 114, column: 37)
!154 = !DILocation(line: 115, column: 21, scope: !143)
!155 = !DILocation(line: 115, column: 13, scope: !143)
!156 = !DILocation(line: 116, column: 13, scope: !143)
!157 = !DILocation(line: 116, column: 31, scope: !143)
!158 = !DILocation(line: 118, column: 20, scope: !143)
!159 = !DILocation(line: 118, column: 18, scope: !143)
!160 = !DILocation(line: 120, column: 5, scope: !144)
!161 = !DILocalVariable(name: "source", scope: !162, file: !17, line: 122, type: !48)
!162 = distinct !DILexicalBlock(scope: !135, file: !17, line: 121, column: 5)
!163 = !DILocation(line: 122, column: 17, scope: !162)
!164 = !DILocation(line: 123, column: 17, scope: !162)
!165 = !DILocation(line: 123, column: 9, scope: !162)
!166 = !DILocation(line: 124, column: 9, scope: !162)
!167 = !DILocation(line: 124, column: 23, scope: !162)
!168 = !DILocation(line: 126, column: 17, scope: !162)
!169 = !DILocation(line: 126, column: 9, scope: !162)
!170 = !DILocation(line: 128, column: 9, scope: !162)
!171 = !DILocation(line: 128, column: 21, scope: !162)
!172 = !DILocation(line: 129, column: 20, scope: !162)
!173 = !DILocation(line: 129, column: 9, scope: !162)
!174 = !DILocation(line: 133, column: 1, scope: !135)
