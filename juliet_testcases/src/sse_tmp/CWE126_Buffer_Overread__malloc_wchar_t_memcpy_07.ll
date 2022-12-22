; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_07.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_07_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  %0 = load i32, i32* @staticFive, align 4, !dbg !26
  %cmp = icmp eq i32 %0, 5, !dbg !28
  br i1 %cmp, label %if.then, label %if.end4, !dbg !29

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !30
  %1 = bitcast i8* %call to i32*, !dbg !32
  store i32* %1, i32** %data, align 8, !dbg !33
  %2 = load i32*, i32** %data, align 8, !dbg !34
  %cmp1 = icmp eq i32* %2, null, !dbg !36
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !37

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !40
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !41
  %4 = load i32*, i32** %data, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  br label %if.end4, !dbg !44

if.end4:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !45, metadata !DIExpression()), !dbg !50
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !51
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !52
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !53
  store i32 0, i32* %arrayidx6, align 4, !dbg !54
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !55
  %5 = bitcast i32* %arraydecay7 to i8*, !dbg !55
  %6 = load i32*, i32** %data, align 8, !dbg !56
  %7 = bitcast i32* %6 to i8*, !dbg !55
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !57
  %call9 = call i64 @wcslen(i32* %arraydecay8) #9, !dbg !58
  %mul = mul i64 %call9, 4, !dbg !59
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %5, i8* align 4 %7, i64 %mul, i1 false), !dbg !55
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !60
  store i32 0, i32* %arrayidx10, align 4, !dbg !61
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !62
  call void @printWLine(i32* %arraydecay11), !dbg !63
  %8 = load i32*, i32** %data, align 8, !dbg !64
  %9 = bitcast i32* %8 to i8*, !dbg !64
  call void @free(i8* %9) #7, !dbg !65
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

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_07_good() #0 !dbg !67 {
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
  %call = call i64 @time(i64* null) #7, !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 %conv) #7, !dbg !83
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_07_good(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_07_bad(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !91 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !92, metadata !DIExpression()), !dbg !93
  store i32* null, i32** %data, align 8, !dbg !94
  %0 = load i32, i32* @staticFive, align 4, !dbg !95
  %cmp = icmp ne i32 %0, 5, !dbg !97
  br i1 %cmp, label %if.then, label %if.else, !dbg !98

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !99
  br label %if.end4, !dbg !101

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !102
  %1 = bitcast i8* %call to i32*, !dbg !104
  store i32* %1, i32** %data, align 8, !dbg !105
  %2 = load i32*, i32** %data, align 8, !dbg !106
  %cmp1 = icmp eq i32* %2, null, !dbg !108
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !109

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !110
  unreachable, !dbg !110

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %data, align 8, !dbg !112
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #7, !dbg !113
  %4 = load i32*, i32** %data, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !114
  store i32 0, i32* %arrayidx, align 4, !dbg !115
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !116, metadata !DIExpression()), !dbg !118
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !119
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !120
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !121
  store i32 0, i32* %arrayidx6, align 4, !dbg !122
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !123
  %5 = bitcast i32* %arraydecay7 to i8*, !dbg !123
  %6 = load i32*, i32** %data, align 8, !dbg !124
  %7 = bitcast i32* %6 to i8*, !dbg !123
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !125
  %call9 = call i64 @wcslen(i32* %arraydecay8) #9, !dbg !126
  %mul = mul i64 %call9, 4, !dbg !127
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %5, i8* align 4 %7, i64 %mul, i1 false), !dbg !123
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !128
  store i32 0, i32* %arrayidx10, align 4, !dbg !129
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !130
  call void @printWLine(i32* %arraydecay11), !dbg !131
  %8 = load i32*, i32** %data, align 8, !dbg !132
  %9 = bitcast i32* %8 to i8*, !dbg !132
  call void @free(i8* %9) #7, !dbg !133
  ret void, !dbg !134
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !135 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !136, metadata !DIExpression()), !dbg !137
  store i32* null, i32** %data, align 8, !dbg !138
  %0 = load i32, i32* @staticFive, align 4, !dbg !139
  %cmp = icmp eq i32 %0, 5, !dbg !141
  br i1 %cmp, label %if.then, label %if.end4, !dbg !142

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !143
  %1 = bitcast i8* %call to i32*, !dbg !145
  store i32* %1, i32** %data, align 8, !dbg !146
  %2 = load i32*, i32** %data, align 8, !dbg !147
  %cmp1 = icmp eq i32* %2, null, !dbg !149
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !150

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !151
  unreachable, !dbg !151

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !153
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #7, !dbg !154
  %4 = load i32*, i32** %data, align 8, !dbg !155
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !155
  store i32 0, i32* %arrayidx, align 4, !dbg !156
  br label %if.end4, !dbg !157

if.end4:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !158, metadata !DIExpression()), !dbg !160
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !161
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !162
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !163
  store i32 0, i32* %arrayidx6, align 4, !dbg !164
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !165
  %5 = bitcast i32* %arraydecay7 to i8*, !dbg !165
  %6 = load i32*, i32** %data, align 8, !dbg !166
  %7 = bitcast i32* %6 to i8*, !dbg !165
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !167
  %call9 = call i64 @wcslen(i32* %arraydecay8) #9, !dbg !168
  %mul = mul i64 %call9, 4, !dbg !169
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %5, i8* align 4 %7, i64 %mul, i1 false), !dbg !165
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !170
  store i32 0, i32* %arrayidx10, align 4, !dbg !171
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !172
  call void @printWLine(i32* %arraydecay11), !dbg !173
  %8 = load i32*, i32** %data, align 8, !dbg !174
  %9 = bitcast i32* %8 to i8*, !dbg !174
  call void @free(i8* %9) #7, !dbg !175
  ret void, !dbg !176
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !13, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0}
!13 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_07.c", directory: "/root/SSE-Assessment")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memcpy_07_bad", scope: !13, file: !13, line: 29, type: !21, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !13, line: 31, type: !6)
!24 = !DILocation(line: 31, column: 15, scope: !20)
!25 = !DILocation(line: 32, column: 10, scope: !20)
!26 = !DILocation(line: 33, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !20, file: !13, line: 33, column: 8)
!28 = !DILocation(line: 33, column: 18, scope: !27)
!29 = !DILocation(line: 33, column: 8, scope: !20)
!30 = !DILocation(line: 36, column: 27, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !13, line: 34, column: 5)
!32 = !DILocation(line: 36, column: 16, scope: !31)
!33 = !DILocation(line: 36, column: 14, scope: !31)
!34 = !DILocation(line: 37, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !13, line: 37, column: 13)
!36 = !DILocation(line: 37, column: 18, scope: !35)
!37 = !DILocation(line: 37, column: 13, scope: !31)
!38 = !DILocation(line: 37, column: 28, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !13, line: 37, column: 27)
!40 = !DILocation(line: 38, column: 17, scope: !31)
!41 = !DILocation(line: 38, column: 9, scope: !31)
!42 = !DILocation(line: 39, column: 9, scope: !31)
!43 = !DILocation(line: 39, column: 20, scope: !31)
!44 = !DILocation(line: 40, column: 5, scope: !31)
!45 = !DILocalVariable(name: "dest", scope: !46, file: !13, line: 42, type: !47)
!46 = distinct !DILexicalBlock(scope: !20, file: !13, line: 41, column: 5)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 100)
!50 = !DILocation(line: 42, column: 17, scope: !46)
!51 = !DILocation(line: 43, column: 17, scope: !46)
!52 = !DILocation(line: 43, column: 9, scope: !46)
!53 = !DILocation(line: 44, column: 9, scope: !46)
!54 = !DILocation(line: 44, column: 21, scope: !46)
!55 = !DILocation(line: 47, column: 9, scope: !46)
!56 = !DILocation(line: 47, column: 22, scope: !46)
!57 = !DILocation(line: 47, column: 35, scope: !46)
!58 = !DILocation(line: 47, column: 28, scope: !46)
!59 = !DILocation(line: 47, column: 40, scope: !46)
!60 = !DILocation(line: 48, column: 9, scope: !46)
!61 = !DILocation(line: 48, column: 21, scope: !46)
!62 = !DILocation(line: 49, column: 20, scope: !46)
!63 = !DILocation(line: 49, column: 9, scope: !46)
!64 = !DILocation(line: 50, column: 14, scope: !46)
!65 = !DILocation(line: 50, column: 9, scope: !46)
!66 = !DILocation(line: 52, column: 1, scope: !20)
!67 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memcpy_07_good", scope: !13, file: !13, line: 115, type: !21, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!68 = !DILocation(line: 117, column: 5, scope: !67)
!69 = !DILocation(line: 118, column: 5, scope: !67)
!70 = !DILocation(line: 119, column: 1, scope: !67)
!71 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 131, type: !72, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!72 = !DISubroutineType(types: !73)
!73 = !{!9, !9, !74}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !13, line: 131, type: !9)
!78 = !DILocation(line: 131, column: 14, scope: !71)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !13, line: 131, type: !74)
!80 = !DILocation(line: 131, column: 27, scope: !71)
!81 = !DILocation(line: 134, column: 22, scope: !71)
!82 = !DILocation(line: 134, column: 12, scope: !71)
!83 = !DILocation(line: 134, column: 5, scope: !71)
!84 = !DILocation(line: 136, column: 5, scope: !71)
!85 = !DILocation(line: 137, column: 5, scope: !71)
!86 = !DILocation(line: 138, column: 5, scope: !71)
!87 = !DILocation(line: 141, column: 5, scope: !71)
!88 = !DILocation(line: 142, column: 5, scope: !71)
!89 = !DILocation(line: 143, column: 5, scope: !71)
!90 = !DILocation(line: 145, column: 5, scope: !71)
!91 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 59, type: !21, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!92 = !DILocalVariable(name: "data", scope: !91, file: !13, line: 61, type: !6)
!93 = !DILocation(line: 61, column: 15, scope: !91)
!94 = !DILocation(line: 62, column: 10, scope: !91)
!95 = !DILocation(line: 63, column: 8, scope: !96)
!96 = distinct !DILexicalBlock(scope: !91, file: !13, line: 63, column: 8)
!97 = !DILocation(line: 63, column: 18, scope: !96)
!98 = !DILocation(line: 63, column: 8, scope: !91)
!99 = !DILocation(line: 66, column: 9, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !13, line: 64, column: 5)
!101 = !DILocation(line: 67, column: 5, scope: !100)
!102 = !DILocation(line: 71, column: 27, scope: !103)
!103 = distinct !DILexicalBlock(scope: !96, file: !13, line: 69, column: 5)
!104 = !DILocation(line: 71, column: 16, scope: !103)
!105 = !DILocation(line: 71, column: 14, scope: !103)
!106 = !DILocation(line: 72, column: 13, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !13, line: 72, column: 13)
!108 = !DILocation(line: 72, column: 18, scope: !107)
!109 = !DILocation(line: 72, column: 13, scope: !103)
!110 = !DILocation(line: 72, column: 28, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !13, line: 72, column: 27)
!112 = !DILocation(line: 73, column: 17, scope: !103)
!113 = !DILocation(line: 73, column: 9, scope: !103)
!114 = !DILocation(line: 74, column: 9, scope: !103)
!115 = !DILocation(line: 74, column: 21, scope: !103)
!116 = !DILocalVariable(name: "dest", scope: !117, file: !13, line: 77, type: !47)
!117 = distinct !DILexicalBlock(scope: !91, file: !13, line: 76, column: 5)
!118 = !DILocation(line: 77, column: 17, scope: !117)
!119 = !DILocation(line: 78, column: 17, scope: !117)
!120 = !DILocation(line: 78, column: 9, scope: !117)
!121 = !DILocation(line: 79, column: 9, scope: !117)
!122 = !DILocation(line: 79, column: 21, scope: !117)
!123 = !DILocation(line: 82, column: 9, scope: !117)
!124 = !DILocation(line: 82, column: 22, scope: !117)
!125 = !DILocation(line: 82, column: 35, scope: !117)
!126 = !DILocation(line: 82, column: 28, scope: !117)
!127 = !DILocation(line: 82, column: 40, scope: !117)
!128 = !DILocation(line: 83, column: 9, scope: !117)
!129 = !DILocation(line: 83, column: 21, scope: !117)
!130 = !DILocation(line: 84, column: 20, scope: !117)
!131 = !DILocation(line: 84, column: 9, scope: !117)
!132 = !DILocation(line: 85, column: 14, scope: !117)
!133 = !DILocation(line: 85, column: 9, scope: !117)
!134 = !DILocation(line: 87, column: 1, scope: !91)
!135 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 90, type: !21, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!136 = !DILocalVariable(name: "data", scope: !135, file: !13, line: 92, type: !6)
!137 = !DILocation(line: 92, column: 15, scope: !135)
!138 = !DILocation(line: 93, column: 10, scope: !135)
!139 = !DILocation(line: 94, column: 8, scope: !140)
!140 = distinct !DILexicalBlock(scope: !135, file: !13, line: 94, column: 8)
!141 = !DILocation(line: 94, column: 18, scope: !140)
!142 = !DILocation(line: 94, column: 8, scope: !135)
!143 = !DILocation(line: 97, column: 27, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !13, line: 95, column: 5)
!145 = !DILocation(line: 97, column: 16, scope: !144)
!146 = !DILocation(line: 97, column: 14, scope: !144)
!147 = !DILocation(line: 98, column: 13, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !13, line: 98, column: 13)
!149 = !DILocation(line: 98, column: 18, scope: !148)
!150 = !DILocation(line: 98, column: 13, scope: !144)
!151 = !DILocation(line: 98, column: 28, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !13, line: 98, column: 27)
!153 = !DILocation(line: 99, column: 17, scope: !144)
!154 = !DILocation(line: 99, column: 9, scope: !144)
!155 = !DILocation(line: 100, column: 9, scope: !144)
!156 = !DILocation(line: 100, column: 21, scope: !144)
!157 = !DILocation(line: 101, column: 5, scope: !144)
!158 = !DILocalVariable(name: "dest", scope: !159, file: !13, line: 103, type: !47)
!159 = distinct !DILexicalBlock(scope: !135, file: !13, line: 102, column: 5)
!160 = !DILocation(line: 103, column: 17, scope: !159)
!161 = !DILocation(line: 104, column: 17, scope: !159)
!162 = !DILocation(line: 104, column: 9, scope: !159)
!163 = !DILocation(line: 105, column: 9, scope: !159)
!164 = !DILocation(line: 105, column: 21, scope: !159)
!165 = !DILocation(line: 108, column: 9, scope: !159)
!166 = !DILocation(line: 108, column: 22, scope: !159)
!167 = !DILocation(line: 108, column: 35, scope: !159)
!168 = !DILocation(line: 108, column: 28, scope: !159)
!169 = !DILocation(line: 108, column: 40, scope: !159)
!170 = !DILocation(line: 109, column: 9, scope: !159)
!171 = !DILocation(line: 109, column: 21, scope: !159)
!172 = !DILocation(line: 110, column: 20, scope: !159)
!173 = !DILocation(line: 110, column: 9, scope: !159)
!174 = !DILocation(line: 111, column: 14, scope: !159)
!175 = !DILocation(line: 111, column: 9, scope: !159)
!176 = !DILocation(line: 113, column: 1, scope: !135)
