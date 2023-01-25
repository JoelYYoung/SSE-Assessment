; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_42.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_42_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %0 = load i32*, i32** %data, align 8, !dbg !23
  %call = call i32* @badSource(i32* %0), !dbg !24
  store i32* %call, i32** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i64* %i, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !31, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !33, metadata !DIExpression()), !dbg !37
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !38
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !39
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !42
  %call3 = call i64 @wcslen(i32* %arraydecay2) #7, !dbg !43
  store i64 %call3, i64* %destLen, align 8, !dbg !44
  store i64 0, i64* %i, align 8, !dbg !45
  br label %for.cond, !dbg !47

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !48
  %2 = load i64, i64* %destLen, align 8, !dbg !50
  %cmp = icmp ult i64 %1, %2, !dbg !51
  br i1 %cmp, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !53
  %4 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx4 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !53
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !53
  %6 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !57
  store i32 %5, i32* %arrayidx5, align 4, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %7, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !65
  store i32 0, i32* %arrayidx6, align 4, !dbg !66
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !67
  call void @printWLine(i32* %arraydecay7), !dbg !68
  %8 = load i32*, i32** %data, align 8, !dbg !69
  %9 = bitcast i32* %8 to i8*, !dbg !69
  call void @free(i8* %9) #6, !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !72 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !77
  %0 = bitcast i8* %call to i32*, !dbg !78
  store i32* %0, i32** %data.addr, align 8, !dbg !79
  %1 = load i32*, i32** %data.addr, align 8, !dbg !80
  %cmp = icmp eq i32* %1, null, !dbg !82
  br i1 %cmp, label %if.then, label %if.end, !dbg !83

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !84
  unreachable, !dbg !84

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data.addr, align 8, !dbg !86
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #6, !dbg !87
  %3 = load i32*, i32** %data.addr, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !88
  store i32 0, i32* %arrayidx, align 4, !dbg !89
  %4 = load i32*, i32** %data.addr, align 8, !dbg !90
  ret i32* %4, !dbg !91
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_42_good() #0 !dbg !92 {
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
  %call = call i64 @time(i64* null) #6, !dbg !105
  %conv = trunc i64 %call to i32, !dbg !106
  call void @srand(i32 %conv) #6, !dbg !107
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !108
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_42_good(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !111
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_42_bad(), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !113
  ret i32 0, !dbg !114
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !115 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !116, metadata !DIExpression()), !dbg !117
  store i32* null, i32** %data, align 8, !dbg !118
  %0 = load i32*, i32** %data, align 8, !dbg !119
  %call = call i32* @goodG2BSource(i32* %0), !dbg !120
  store i32* %call, i32** %data, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata i64* %i, metadata !122, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !127, metadata !DIExpression()), !dbg !128
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !129
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !130
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !131
  store i32 0, i32* %arrayidx, align 4, !dbg !132
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !133
  %call3 = call i64 @wcslen(i32* %arraydecay2) #7, !dbg !134
  store i64 %call3, i64* %destLen, align 8, !dbg !135
  store i64 0, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !138

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !139
  %2 = load i64, i64* %destLen, align 8, !dbg !141
  %cmp = icmp ult i64 %1, %2, !dbg !142
  br i1 %cmp, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !144
  %4 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx4 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !144
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !144
  %6 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !148
  store i32 %5, i32* %arrayidx5, align 4, !dbg !149
  br label %for.inc, !dbg !150

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !151
  %inc = add i64 %7, 1, !dbg !151
  store i64 %inc, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !152, !llvm.loop !153

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !155
  store i32 0, i32* %arrayidx6, align 4, !dbg !156
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !157
  call void @printWLine(i32* %arraydecay7), !dbg !158
  %8 = load i32*, i32** %data, align 8, !dbg !159
  %9 = bitcast i32* %8 to i8*, !dbg !159
  call void @free(i8* %9) #6, !dbg !160
  ret void, !dbg !161
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2BSource(i32* %data) #0 !dbg !162 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !163, metadata !DIExpression()), !dbg !164
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !165
  %0 = bitcast i8* %call to i32*, !dbg !166
  store i32* %0, i32** %data.addr, align 8, !dbg !167
  %1 = load i32*, i32** %data.addr, align 8, !dbg !168
  %cmp = icmp eq i32* %1, null, !dbg !170
  br i1 %cmp, label %if.then, label %if.end, !dbg !171

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !172
  unreachable, !dbg !172

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data.addr, align 8, !dbg !174
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !175
  %3 = load i32*, i32** %data.addr, align 8, !dbg !176
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !176
  store i32 0, i32* %arrayidx, align 4, !dbg !177
  %4 = load i32*, i32** %data.addr, align 8, !dbg !178
  ret i32* %4, !dbg !179
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_42.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !9}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_42_bad", scope: !17, file: !17, line: 33, type: !18, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_42.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 35, type: !5)
!21 = !DILocation(line: 35, column: 15, scope: !16)
!22 = !DILocation(line: 36, column: 10, scope: !16)
!23 = !DILocation(line: 37, column: 22, scope: !16)
!24 = !DILocation(line: 37, column: 12, scope: !16)
!25 = !DILocation(line: 37, column: 10, scope: !16)
!26 = !DILocalVariable(name: "i", scope: !27, file: !17, line: 39, type: !28)
!27 = distinct !DILexicalBlock(scope: !16, file: !17, line: 38, column: 5)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !7, line: 46, baseType: !29)
!29 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!30 = !DILocation(line: 39, column: 16, scope: !27)
!31 = !DILocalVariable(name: "destLen", scope: !27, file: !17, line: 39, type: !28)
!32 = !DILocation(line: 39, column: 19, scope: !27)
!33 = !DILocalVariable(name: "dest", scope: !27, file: !17, line: 40, type: !34)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 40, column: 17, scope: !27)
!38 = !DILocation(line: 41, column: 17, scope: !27)
!39 = !DILocation(line: 41, column: 9, scope: !27)
!40 = !DILocation(line: 42, column: 9, scope: !27)
!41 = !DILocation(line: 42, column: 21, scope: !27)
!42 = !DILocation(line: 43, column: 26, scope: !27)
!43 = !DILocation(line: 43, column: 19, scope: !27)
!44 = !DILocation(line: 43, column: 17, scope: !27)
!45 = !DILocation(line: 46, column: 16, scope: !46)
!46 = distinct !DILexicalBlock(scope: !27, file: !17, line: 46, column: 9)
!47 = !DILocation(line: 46, column: 14, scope: !46)
!48 = !DILocation(line: 46, column: 21, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !17, line: 46, column: 9)
!50 = !DILocation(line: 46, column: 25, scope: !49)
!51 = !DILocation(line: 46, column: 23, scope: !49)
!52 = !DILocation(line: 46, column: 9, scope: !46)
!53 = !DILocation(line: 48, column: 23, scope: !54)
!54 = distinct !DILexicalBlock(scope: !49, file: !17, line: 47, column: 9)
!55 = !DILocation(line: 48, column: 28, scope: !54)
!56 = !DILocation(line: 48, column: 18, scope: !54)
!57 = !DILocation(line: 48, column: 13, scope: !54)
!58 = !DILocation(line: 48, column: 21, scope: !54)
!59 = !DILocation(line: 49, column: 9, scope: !54)
!60 = !DILocation(line: 46, column: 35, scope: !49)
!61 = !DILocation(line: 46, column: 9, scope: !49)
!62 = distinct !{!62, !52, !63, !64}
!63 = !DILocation(line: 49, column: 9, scope: !46)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 50, column: 9, scope: !27)
!66 = !DILocation(line: 50, column: 21, scope: !27)
!67 = !DILocation(line: 51, column: 20, scope: !27)
!68 = !DILocation(line: 51, column: 9, scope: !27)
!69 = !DILocation(line: 52, column: 14, scope: !27)
!70 = !DILocation(line: 52, column: 9, scope: !27)
!71 = !DILocation(line: 54, column: 1, scope: !16)
!72 = distinct !DISubprogram(name: "badSource", scope: !17, file: !17, line: 23, type: !73, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!5, !5}
!75 = !DILocalVariable(name: "data", arg: 1, scope: !72, file: !17, line: 23, type: !5)
!76 = !DILocation(line: 23, column: 38, scope: !72)
!77 = !DILocation(line: 26, column: 23, scope: !72)
!78 = !DILocation(line: 26, column: 12, scope: !72)
!79 = !DILocation(line: 26, column: 10, scope: !72)
!80 = !DILocation(line: 27, column: 9, scope: !81)
!81 = distinct !DILexicalBlock(scope: !72, file: !17, line: 27, column: 9)
!82 = !DILocation(line: 27, column: 14, scope: !81)
!83 = !DILocation(line: 27, column: 9, scope: !72)
!84 = !DILocation(line: 27, column: 24, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !17, line: 27, column: 23)
!86 = !DILocation(line: 28, column: 13, scope: !72)
!87 = !DILocation(line: 28, column: 5, scope: !72)
!88 = !DILocation(line: 29, column: 5, scope: !72)
!89 = !DILocation(line: 29, column: 16, scope: !72)
!90 = !DILocation(line: 30, column: 12, scope: !72)
!91 = !DILocation(line: 30, column: 5, scope: !72)
!92 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_42_good", scope: !17, file: !17, line: 94, type: !18, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocation(line: 96, column: 5, scope: !92)
!94 = !DILocation(line: 97, column: 1, scope: !92)
!95 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 109, type: !96, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DISubroutineType(types: !97)
!97 = !{!8, !8, !98}
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!101 = !DILocalVariable(name: "argc", arg: 1, scope: !95, file: !17, line: 109, type: !8)
!102 = !DILocation(line: 109, column: 14, scope: !95)
!103 = !DILocalVariable(name: "argv", arg: 2, scope: !95, file: !17, line: 109, type: !98)
!104 = !DILocation(line: 109, column: 27, scope: !95)
!105 = !DILocation(line: 112, column: 22, scope: !95)
!106 = !DILocation(line: 112, column: 12, scope: !95)
!107 = !DILocation(line: 112, column: 5, scope: !95)
!108 = !DILocation(line: 114, column: 5, scope: !95)
!109 = !DILocation(line: 115, column: 5, scope: !95)
!110 = !DILocation(line: 116, column: 5, scope: !95)
!111 = !DILocation(line: 119, column: 5, scope: !95)
!112 = !DILocation(line: 120, column: 5, scope: !95)
!113 = !DILocation(line: 121, column: 5, scope: !95)
!114 = !DILocation(line: 123, column: 5, scope: !95)
!115 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 71, type: !18, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DILocalVariable(name: "data", scope: !115, file: !17, line: 73, type: !5)
!117 = !DILocation(line: 73, column: 15, scope: !115)
!118 = !DILocation(line: 74, column: 10, scope: !115)
!119 = !DILocation(line: 75, column: 26, scope: !115)
!120 = !DILocation(line: 75, column: 12, scope: !115)
!121 = !DILocation(line: 75, column: 10, scope: !115)
!122 = !DILocalVariable(name: "i", scope: !123, file: !17, line: 77, type: !28)
!123 = distinct !DILexicalBlock(scope: !115, file: !17, line: 76, column: 5)
!124 = !DILocation(line: 77, column: 16, scope: !123)
!125 = !DILocalVariable(name: "destLen", scope: !123, file: !17, line: 77, type: !28)
!126 = !DILocation(line: 77, column: 19, scope: !123)
!127 = !DILocalVariable(name: "dest", scope: !123, file: !17, line: 78, type: !34)
!128 = !DILocation(line: 78, column: 17, scope: !123)
!129 = !DILocation(line: 79, column: 17, scope: !123)
!130 = !DILocation(line: 79, column: 9, scope: !123)
!131 = !DILocation(line: 80, column: 9, scope: !123)
!132 = !DILocation(line: 80, column: 21, scope: !123)
!133 = !DILocation(line: 81, column: 26, scope: !123)
!134 = !DILocation(line: 81, column: 19, scope: !123)
!135 = !DILocation(line: 81, column: 17, scope: !123)
!136 = !DILocation(line: 84, column: 16, scope: !137)
!137 = distinct !DILexicalBlock(scope: !123, file: !17, line: 84, column: 9)
!138 = !DILocation(line: 84, column: 14, scope: !137)
!139 = !DILocation(line: 84, column: 21, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !17, line: 84, column: 9)
!141 = !DILocation(line: 84, column: 25, scope: !140)
!142 = !DILocation(line: 84, column: 23, scope: !140)
!143 = !DILocation(line: 84, column: 9, scope: !137)
!144 = !DILocation(line: 86, column: 23, scope: !145)
!145 = distinct !DILexicalBlock(scope: !140, file: !17, line: 85, column: 9)
!146 = !DILocation(line: 86, column: 28, scope: !145)
!147 = !DILocation(line: 86, column: 18, scope: !145)
!148 = !DILocation(line: 86, column: 13, scope: !145)
!149 = !DILocation(line: 86, column: 21, scope: !145)
!150 = !DILocation(line: 87, column: 9, scope: !145)
!151 = !DILocation(line: 84, column: 35, scope: !140)
!152 = !DILocation(line: 84, column: 9, scope: !140)
!153 = distinct !{!153, !143, !154, !64}
!154 = !DILocation(line: 87, column: 9, scope: !137)
!155 = !DILocation(line: 88, column: 9, scope: !123)
!156 = !DILocation(line: 88, column: 21, scope: !123)
!157 = !DILocation(line: 89, column: 20, scope: !123)
!158 = !DILocation(line: 89, column: 9, scope: !123)
!159 = !DILocation(line: 90, column: 14, scope: !123)
!160 = !DILocation(line: 90, column: 9, scope: !123)
!161 = !DILocation(line: 92, column: 1, scope: !115)
!162 = distinct !DISubprogram(name: "goodG2BSource", scope: !17, file: !17, line: 60, type: !73, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!163 = !DILocalVariable(name: "data", arg: 1, scope: !162, file: !17, line: 60, type: !5)
!164 = !DILocation(line: 60, column: 42, scope: !162)
!165 = !DILocation(line: 63, column: 23, scope: !162)
!166 = !DILocation(line: 63, column: 12, scope: !162)
!167 = !DILocation(line: 63, column: 10, scope: !162)
!168 = !DILocation(line: 64, column: 9, scope: !169)
!169 = distinct !DILexicalBlock(scope: !162, file: !17, line: 64, column: 9)
!170 = !DILocation(line: 64, column: 14, scope: !169)
!171 = !DILocation(line: 64, column: 9, scope: !162)
!172 = !DILocation(line: 64, column: 24, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !17, line: 64, column: 23)
!174 = !DILocation(line: 65, column: 13, scope: !162)
!175 = !DILocation(line: 65, column: 5, scope: !162)
!176 = !DILocation(line: 66, column: 5, scope: !162)
!177 = !DILocation(line: 66, column: 17, scope: !162)
!178 = !DILocation(line: 67, column: 12, scope: !162)
!179 = !DILocation(line: 67, column: 5, scope: !162)
