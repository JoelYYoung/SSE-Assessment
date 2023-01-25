; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_08.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_08_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call i32 @staticReturnsTrue(), !dbg !23
  %tobool = icmp ne i32 %call, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.end4, !dbg !25

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !26
  %0 = bitcast i8* %call1 to i32*, !dbg !28
  store i32* %0, i32** %data, align 8, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then2, label %if.end, !dbg !33

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %data, align 8, !dbg !36
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !37
  %3 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  br label %if.end4, !dbg !40

if.end4:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !41, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !47
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !48
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !49
  store i32 0, i32* %arrayidx6, align 4, !dbg !50
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !51
  %4 = bitcast i32* %arraydecay7 to i8*, !dbg !51
  %5 = load i32*, i32** %data, align 8, !dbg !52
  %6 = bitcast i32* %5 to i8*, !dbg !51
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !53
  %call9 = call i64 @wcslen(i32* %arraydecay8) #9, !dbg !54
  %mul = mul i64 %call9, 4, !dbg !55
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %4, i8* align 4 %6, i64 %mul, i1 false), !dbg !51
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !56
  store i32 0, i32* %arrayidx10, align 4, !dbg !57
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !58
  call void @printWLine(i32* %arraydecay11), !dbg !59
  %7 = load i32*, i32** %data, align 8, !dbg !60
  %8 = bitcast i32* %7 to i8*, !dbg !60
  call void @free(i8* %8) #7, !dbg !61
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

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_08_good() #0 !dbg !63 {
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
  %call = call i64 @time(i64* null) #7, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #7, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_08_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_08_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !87 {
entry:
  ret i32 1, !dbg !90
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !91 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !92, metadata !DIExpression()), !dbg !93
  store i32* null, i32** %data, align 8, !dbg !94
  %call = call i32 @staticReturnsFalse(), !dbg !95
  %tobool = icmp ne i32 %call, 0, !dbg !95
  br i1 %tobool, label %if.then, label %if.else, !dbg !97

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !98
  br label %if.end4, !dbg !100

if.else:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !101
  %0 = bitcast i8* %call1 to i32*, !dbg !103
  store i32* %0, i32** %data, align 8, !dbg !104
  %1 = load i32*, i32** %data, align 8, !dbg !105
  %cmp = icmp eq i32* %1, null, !dbg !107
  br i1 %cmp, label %if.then2, label %if.end, !dbg !108

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !109
  unreachable, !dbg !109

if.end:                                           ; preds = %if.else
  %2 = load i32*, i32** %data, align 8, !dbg !111
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 99) #7, !dbg !112
  %3 = load i32*, i32** %data, align 8, !dbg !113
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !113
  store i32 0, i32* %arrayidx, align 4, !dbg !114
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !115, metadata !DIExpression()), !dbg !117
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !118
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !119
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !120
  store i32 0, i32* %arrayidx6, align 4, !dbg !121
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !122
  %4 = bitcast i32* %arraydecay7 to i8*, !dbg !122
  %5 = load i32*, i32** %data, align 8, !dbg !123
  %6 = bitcast i32* %5 to i8*, !dbg !122
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !124
  %call9 = call i64 @wcslen(i32* %arraydecay8) #9, !dbg !125
  %mul = mul i64 %call9, 4, !dbg !126
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %4, i8* align 4 %6, i64 %mul, i1 false), !dbg !122
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !127
  store i32 0, i32* %arrayidx10, align 4, !dbg !128
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !129
  call void @printWLine(i32* %arraydecay11), !dbg !130
  %7 = load i32*, i32** %data, align 8, !dbg !131
  %8 = bitcast i32* %7 to i8*, !dbg !131
  call void @free(i8* %8) #7, !dbg !132
  ret void, !dbg !133
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !134 {
entry:
  ret i32 0, !dbg !135
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !136 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !137, metadata !DIExpression()), !dbg !138
  store i32* null, i32** %data, align 8, !dbg !139
  %call = call i32 @staticReturnsTrue(), !dbg !140
  %tobool = icmp ne i32 %call, 0, !dbg !140
  br i1 %tobool, label %if.then, label %if.end4, !dbg !142

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !143
  %0 = bitcast i8* %call1 to i32*, !dbg !145
  store i32* %0, i32** %data, align 8, !dbg !146
  %1 = load i32*, i32** %data, align 8, !dbg !147
  %cmp = icmp eq i32* %1, null, !dbg !149
  br i1 %cmp, label %if.then2, label %if.end, !dbg !150

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !151
  unreachable, !dbg !151

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %data, align 8, !dbg !153
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 99) #7, !dbg !154
  %3 = load i32*, i32** %data, align 8, !dbg !155
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !155
  store i32 0, i32* %arrayidx, align 4, !dbg !156
  br label %if.end4, !dbg !157

if.end4:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !158, metadata !DIExpression()), !dbg !160
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !161
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !162
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !163
  store i32 0, i32* %arrayidx6, align 4, !dbg !164
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !165
  %4 = bitcast i32* %arraydecay7 to i8*, !dbg !165
  %5 = load i32*, i32** %data, align 8, !dbg !166
  %6 = bitcast i32* %5 to i8*, !dbg !165
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !167
  %call9 = call i64 @wcslen(i32* %arraydecay8) #9, !dbg !168
  %mul = mul i64 %call9, 4, !dbg !169
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %4, i8* align 4 %6, i64 %mul, i1 false), !dbg !165
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !170
  store i32 0, i32* %arrayidx10, align 4, !dbg !171
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !172
  call void @printWLine(i32* %arraydecay11), !dbg !173
  %7 = load i32*, i32** %data, align 8, !dbg !174
  %8 = bitcast i32* %7 to i8*, !dbg !174
  call void @free(i8* %8) #7, !dbg !175
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_08_bad", scope: !17, file: !17, line: 37, type: !18, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_08.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 39, type: !4)
!21 = !DILocation(line: 39, column: 15, scope: !16)
!22 = !DILocation(line: 40, column: 10, scope: !16)
!23 = !DILocation(line: 41, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 41, column: 8)
!25 = !DILocation(line: 41, column: 8, scope: !16)
!26 = !DILocation(line: 44, column: 27, scope: !27)
!27 = distinct !DILexicalBlock(scope: !24, file: !17, line: 42, column: 5)
!28 = !DILocation(line: 44, column: 16, scope: !27)
!29 = !DILocation(line: 44, column: 14, scope: !27)
!30 = !DILocation(line: 45, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !17, line: 45, column: 13)
!32 = !DILocation(line: 45, column: 18, scope: !31)
!33 = !DILocation(line: 45, column: 13, scope: !27)
!34 = !DILocation(line: 45, column: 28, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !17, line: 45, column: 27)
!36 = !DILocation(line: 46, column: 17, scope: !27)
!37 = !DILocation(line: 46, column: 9, scope: !27)
!38 = !DILocation(line: 47, column: 9, scope: !27)
!39 = !DILocation(line: 47, column: 20, scope: !27)
!40 = !DILocation(line: 48, column: 5, scope: !27)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !17, line: 50, type: !43)
!42 = distinct !DILexicalBlock(scope: !16, file: !17, line: 49, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 50, column: 17, scope: !42)
!47 = !DILocation(line: 51, column: 17, scope: !42)
!48 = !DILocation(line: 51, column: 9, scope: !42)
!49 = !DILocation(line: 52, column: 9, scope: !42)
!50 = !DILocation(line: 52, column: 21, scope: !42)
!51 = !DILocation(line: 55, column: 9, scope: !42)
!52 = !DILocation(line: 55, column: 23, scope: !42)
!53 = !DILocation(line: 55, column: 36, scope: !42)
!54 = !DILocation(line: 55, column: 29, scope: !42)
!55 = !DILocation(line: 55, column: 41, scope: !42)
!56 = !DILocation(line: 56, column: 9, scope: !42)
!57 = !DILocation(line: 56, column: 21, scope: !42)
!58 = !DILocation(line: 57, column: 20, scope: !42)
!59 = !DILocation(line: 57, column: 9, scope: !42)
!60 = !DILocation(line: 58, column: 14, scope: !42)
!61 = !DILocation(line: 58, column: 9, scope: !42)
!62 = !DILocation(line: 60, column: 1, scope: !16)
!63 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_08_good", scope: !17, file: !17, line: 123, type: !18, scopeLine: 124, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 125, column: 5, scope: !63)
!65 = !DILocation(line: 126, column: 5, scope: !63)
!66 = !DILocation(line: 127, column: 1, scope: !63)
!67 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 139, type: !68, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!7, !7, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !17, line: 139, type: !7)
!74 = !DILocation(line: 139, column: 14, scope: !67)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !17, line: 139, type: !70)
!76 = !DILocation(line: 139, column: 27, scope: !67)
!77 = !DILocation(line: 142, column: 22, scope: !67)
!78 = !DILocation(line: 142, column: 12, scope: !67)
!79 = !DILocation(line: 142, column: 5, scope: !67)
!80 = !DILocation(line: 144, column: 5, scope: !67)
!81 = !DILocation(line: 145, column: 5, scope: !67)
!82 = !DILocation(line: 146, column: 5, scope: !67)
!83 = !DILocation(line: 149, column: 5, scope: !67)
!84 = !DILocation(line: 150, column: 5, scope: !67)
!85 = !DILocation(line: 151, column: 5, scope: !67)
!86 = !DILocation(line: 153, column: 5, scope: !67)
!87 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !17, file: !17, line: 25, type: !88, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DISubroutineType(types: !89)
!89 = !{!7}
!90 = !DILocation(line: 27, column: 5, scope: !87)
!91 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 67, type: !18, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocalVariable(name: "data", scope: !91, file: !17, line: 69, type: !4)
!93 = !DILocation(line: 69, column: 15, scope: !91)
!94 = !DILocation(line: 70, column: 10, scope: !91)
!95 = !DILocation(line: 71, column: 8, scope: !96)
!96 = distinct !DILexicalBlock(scope: !91, file: !17, line: 71, column: 8)
!97 = !DILocation(line: 71, column: 8, scope: !91)
!98 = !DILocation(line: 74, column: 9, scope: !99)
!99 = distinct !DILexicalBlock(scope: !96, file: !17, line: 72, column: 5)
!100 = !DILocation(line: 75, column: 5, scope: !99)
!101 = !DILocation(line: 79, column: 27, scope: !102)
!102 = distinct !DILexicalBlock(scope: !96, file: !17, line: 77, column: 5)
!103 = !DILocation(line: 79, column: 16, scope: !102)
!104 = !DILocation(line: 79, column: 14, scope: !102)
!105 = !DILocation(line: 80, column: 13, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !17, line: 80, column: 13)
!107 = !DILocation(line: 80, column: 18, scope: !106)
!108 = !DILocation(line: 80, column: 13, scope: !102)
!109 = !DILocation(line: 80, column: 28, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !17, line: 80, column: 27)
!111 = !DILocation(line: 81, column: 17, scope: !102)
!112 = !DILocation(line: 81, column: 9, scope: !102)
!113 = !DILocation(line: 82, column: 9, scope: !102)
!114 = !DILocation(line: 82, column: 21, scope: !102)
!115 = !DILocalVariable(name: "dest", scope: !116, file: !17, line: 85, type: !43)
!116 = distinct !DILexicalBlock(scope: !91, file: !17, line: 84, column: 5)
!117 = !DILocation(line: 85, column: 17, scope: !116)
!118 = !DILocation(line: 86, column: 17, scope: !116)
!119 = !DILocation(line: 86, column: 9, scope: !116)
!120 = !DILocation(line: 87, column: 9, scope: !116)
!121 = !DILocation(line: 87, column: 21, scope: !116)
!122 = !DILocation(line: 90, column: 9, scope: !116)
!123 = !DILocation(line: 90, column: 23, scope: !116)
!124 = !DILocation(line: 90, column: 36, scope: !116)
!125 = !DILocation(line: 90, column: 29, scope: !116)
!126 = !DILocation(line: 90, column: 41, scope: !116)
!127 = !DILocation(line: 91, column: 9, scope: !116)
!128 = !DILocation(line: 91, column: 21, scope: !116)
!129 = !DILocation(line: 92, column: 20, scope: !116)
!130 = !DILocation(line: 92, column: 9, scope: !116)
!131 = !DILocation(line: 93, column: 14, scope: !116)
!132 = !DILocation(line: 93, column: 9, scope: !116)
!133 = !DILocation(line: 95, column: 1, scope: !91)
!134 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !17, file: !17, line: 30, type: !88, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!135 = !DILocation(line: 32, column: 5, scope: !134)
!136 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 98, type: !18, scopeLine: 99, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!137 = !DILocalVariable(name: "data", scope: !136, file: !17, line: 100, type: !4)
!138 = !DILocation(line: 100, column: 15, scope: !136)
!139 = !DILocation(line: 101, column: 10, scope: !136)
!140 = !DILocation(line: 102, column: 8, scope: !141)
!141 = distinct !DILexicalBlock(scope: !136, file: !17, line: 102, column: 8)
!142 = !DILocation(line: 102, column: 8, scope: !136)
!143 = !DILocation(line: 105, column: 27, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !17, line: 103, column: 5)
!145 = !DILocation(line: 105, column: 16, scope: !144)
!146 = !DILocation(line: 105, column: 14, scope: !144)
!147 = !DILocation(line: 106, column: 13, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !17, line: 106, column: 13)
!149 = !DILocation(line: 106, column: 18, scope: !148)
!150 = !DILocation(line: 106, column: 13, scope: !144)
!151 = !DILocation(line: 106, column: 28, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !17, line: 106, column: 27)
!153 = !DILocation(line: 107, column: 17, scope: !144)
!154 = !DILocation(line: 107, column: 9, scope: !144)
!155 = !DILocation(line: 108, column: 9, scope: !144)
!156 = !DILocation(line: 108, column: 21, scope: !144)
!157 = !DILocation(line: 109, column: 5, scope: !144)
!158 = !DILocalVariable(name: "dest", scope: !159, file: !17, line: 111, type: !43)
!159 = distinct !DILexicalBlock(scope: !136, file: !17, line: 110, column: 5)
!160 = !DILocation(line: 111, column: 17, scope: !159)
!161 = !DILocation(line: 112, column: 17, scope: !159)
!162 = !DILocation(line: 112, column: 9, scope: !159)
!163 = !DILocation(line: 113, column: 9, scope: !159)
!164 = !DILocation(line: 113, column: 21, scope: !159)
!165 = !DILocation(line: 116, column: 9, scope: !159)
!166 = !DILocation(line: 116, column: 23, scope: !159)
!167 = !DILocation(line: 116, column: 36, scope: !159)
!168 = !DILocation(line: 116, column: 29, scope: !159)
!169 = !DILocation(line: 116, column: 41, scope: !159)
!170 = !DILocation(line: 117, column: 9, scope: !159)
!171 = !DILocation(line: 117, column: 21, scope: !159)
!172 = !DILocation(line: 118, column: 20, scope: !159)
!173 = !DILocation(line: 118, column: 9, scope: !159)
!174 = !DILocation(line: 119, column: 14, scope: !159)
!175 = !DILocation(line: 119, column: 9, scope: !159)
!176 = !DILocation(line: 121, column: 1, scope: !136)
