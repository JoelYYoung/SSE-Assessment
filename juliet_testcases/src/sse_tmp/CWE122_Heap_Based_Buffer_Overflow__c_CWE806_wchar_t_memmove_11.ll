; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_11.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_11_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %call = call noalias align 16 i8* @malloc(i64 400) #8, !dbg !22
  %0 = bitcast i8* %call to i32*, !dbg !23
  store i32* %0, i32** %data, align 8, !dbg !24
  %1 = load i32*, i32** %data, align 8, !dbg !25
  %cmp = icmp eq i32* %1, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !31
  %tobool = icmp ne i32 %call1, 0, !dbg !31
  br i1 %tobool, label %if.then2, label %if.end4, !dbg !33

if.then2:                                         ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !34
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 99) #8, !dbg !36
  %3 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  br label %if.end4, !dbg !39

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !40, metadata !DIExpression()), !dbg !45
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !45
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !46
  %5 = bitcast i32* %arraydecay to i8*, !dbg !46
  %6 = load i32*, i32** %data, align 8, !dbg !47
  %7 = bitcast i32* %6 to i8*, !dbg !46
  %8 = load i32*, i32** %data, align 8, !dbg !48
  %call5 = call i64 @wcslen(i32* %8) #10, !dbg !49
  %mul = mul i64 %call5, 4, !dbg !50
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %5, i8* align 4 %7, i64 %mul, i1 false), !dbg !46
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !51
  store i32 0, i32* %arrayidx6, align 4, !dbg !52
  %9 = load i32*, i32** %data, align 8, !dbg !53
  call void @printWLine(i32* %9), !dbg !54
  %10 = load i32*, i32** %data, align 8, !dbg !55
  %11 = bitcast i32* %10 to i8*, !dbg !55
  call void @free(i8* %11) #8, !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local i32 @globalReturnsTrue(...) #4

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #6

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #7

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_11_good() #0 !dbg !58 {
entry:
  call void @goodG2B1(), !dbg !59
  call void @goodG2B2(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #8, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #8, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_11_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_11_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !82 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call noalias align 16 i8* @malloc(i64 400) #8, !dbg !85
  %0 = bitcast i8* %call to i32*, !dbg !86
  store i32* %0, i32** %data, align 8, !dbg !87
  %1 = load i32*, i32** %data, align 8, !dbg !88
  %cmp = icmp eq i32* %1, null, !dbg !90
  br i1 %cmp, label %if.then, label %if.end, !dbg !91

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !92
  unreachable, !dbg !92

if.end:                                           ; preds = %entry
  %call1 = call i32 (...) @globalReturnsFalse(), !dbg !94
  %tobool = icmp ne i32 %call1, 0, !dbg !94
  br i1 %tobool, label %if.then2, label %if.else, !dbg !96

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !97
  br label %if.end4, !dbg !99

if.else:                                          ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !100
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 49) #8, !dbg !102
  %3 = load i32*, i32** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !103
  store i32 0, i32* %arrayidx, align 4, !dbg !104
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !105, metadata !DIExpression()), !dbg !107
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !107
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !108
  %5 = bitcast i32* %arraydecay to i8*, !dbg !108
  %6 = load i32*, i32** %data, align 8, !dbg !109
  %7 = bitcast i32* %6 to i8*, !dbg !108
  %8 = load i32*, i32** %data, align 8, !dbg !110
  %call5 = call i64 @wcslen(i32* %8) #10, !dbg !111
  %mul = mul i64 %call5, 4, !dbg !112
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %5, i8* align 4 %7, i64 %mul, i1 false), !dbg !108
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !113
  store i32 0, i32* %arrayidx6, align 4, !dbg !114
  %9 = load i32*, i32** %data, align 8, !dbg !115
  call void @printWLine(i32* %9), !dbg !116
  %10 = load i32*, i32** %data, align 8, !dbg !117
  %11 = bitcast i32* %10 to i8*, !dbg !117
  call void @free(i8* %11) #8, !dbg !118
  ret void, !dbg !119
}

declare dso_local i32 @globalReturnsFalse(...) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !120 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !121, metadata !DIExpression()), !dbg !122
  %call = call noalias align 16 i8* @malloc(i64 400) #8, !dbg !123
  %0 = bitcast i8* %call to i32*, !dbg !124
  store i32* %0, i32** %data, align 8, !dbg !125
  %1 = load i32*, i32** %data, align 8, !dbg !126
  %cmp = icmp eq i32* %1, null, !dbg !128
  br i1 %cmp, label %if.then, label %if.end, !dbg !129

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !130
  unreachable, !dbg !130

if.end:                                           ; preds = %entry
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !132
  %tobool = icmp ne i32 %call1, 0, !dbg !132
  br i1 %tobool, label %if.then2, label %if.end4, !dbg !134

if.then2:                                         ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !135
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 49) #8, !dbg !137
  %3 = load i32*, i32** %data, align 8, !dbg !138
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !138
  store i32 0, i32* %arrayidx, align 4, !dbg !139
  br label %if.end4, !dbg !140

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !141, metadata !DIExpression()), !dbg !143
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !143
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !143
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !144
  %5 = bitcast i32* %arraydecay to i8*, !dbg !144
  %6 = load i32*, i32** %data, align 8, !dbg !145
  %7 = bitcast i32* %6 to i8*, !dbg !144
  %8 = load i32*, i32** %data, align 8, !dbg !146
  %call5 = call i64 @wcslen(i32* %8) #10, !dbg !147
  %mul = mul i64 %call5, 4, !dbg !148
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %5, i8* align 4 %7, i64 %mul, i1 false), !dbg !144
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !149
  store i32 0, i32* %arrayidx6, align 4, !dbg !150
  %9 = load i32*, i32** %data, align 8, !dbg !151
  call void @printWLine(i32* %9), !dbg !152
  %10 = load i32*, i32** %data, align 8, !dbg !153
  %11 = bitcast i32* %10 to i8*, !dbg !153
  call void @free(i8* %11) #8, !dbg !154
  ret void, !dbg !155
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { argmemonly nofree nounwind willreturn }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_11.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_11_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_11.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 23, scope: !16)
!23 = !DILocation(line: 26, column: 12, scope: !16)
!24 = !DILocation(line: 26, column: 10, scope: !16)
!25 = !DILocation(line: 27, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 9)
!27 = !DILocation(line: 27, column: 14, scope: !26)
!28 = !DILocation(line: 27, column: 9, scope: !16)
!29 = !DILocation(line: 27, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !17, line: 27, column: 23)
!31 = !DILocation(line: 28, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !16, file: !17, line: 28, column: 8)
!33 = !DILocation(line: 28, column: 8, scope: !16)
!34 = !DILocation(line: 31, column: 17, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !17, line: 29, column: 5)
!36 = !DILocation(line: 31, column: 9, scope: !35)
!37 = !DILocation(line: 32, column: 9, scope: !35)
!38 = !DILocation(line: 32, column: 21, scope: !35)
!39 = !DILocation(line: 33, column: 5, scope: !35)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !17, line: 35, type: !42)
!41 = distinct !DILexicalBlock(scope: !16, file: !17, line: 34, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 50)
!45 = !DILocation(line: 35, column: 17, scope: !41)
!46 = !DILocation(line: 37, column: 9, scope: !41)
!47 = !DILocation(line: 37, column: 23, scope: !41)
!48 = !DILocation(line: 37, column: 36, scope: !41)
!49 = !DILocation(line: 37, column: 29, scope: !41)
!50 = !DILocation(line: 37, column: 41, scope: !41)
!51 = !DILocation(line: 38, column: 9, scope: !41)
!52 = !DILocation(line: 38, column: 20, scope: !41)
!53 = !DILocation(line: 39, column: 20, scope: !41)
!54 = !DILocation(line: 39, column: 9, scope: !41)
!55 = !DILocation(line: 40, column: 14, scope: !41)
!56 = !DILocation(line: 40, column: 9, scope: !41)
!57 = !DILocation(line: 42, column: 1, scope: !16)
!58 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_11_good", scope: !17, file: !17, line: 97, type: !18, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 99, column: 5, scope: !58)
!60 = !DILocation(line: 100, column: 5, scope: !58)
!61 = !DILocation(line: 101, column: 1, scope: !58)
!62 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 113, type: !63, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!7, !7, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !17, line: 113, type: !7)
!69 = !DILocation(line: 113, column: 14, scope: !62)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !17, line: 113, type: !65)
!71 = !DILocation(line: 113, column: 27, scope: !62)
!72 = !DILocation(line: 116, column: 22, scope: !62)
!73 = !DILocation(line: 116, column: 12, scope: !62)
!74 = !DILocation(line: 116, column: 5, scope: !62)
!75 = !DILocation(line: 118, column: 5, scope: !62)
!76 = !DILocation(line: 119, column: 5, scope: !62)
!77 = !DILocation(line: 120, column: 5, scope: !62)
!78 = !DILocation(line: 123, column: 5, scope: !62)
!79 = !DILocation(line: 124, column: 5, scope: !62)
!80 = !DILocation(line: 125, column: 5, scope: !62)
!81 = !DILocation(line: 127, column: 5, scope: !62)
!82 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 49, type: !18, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !17, line: 51, type: !4)
!84 = !DILocation(line: 51, column: 15, scope: !82)
!85 = !DILocation(line: 52, column: 23, scope: !82)
!86 = !DILocation(line: 52, column: 12, scope: !82)
!87 = !DILocation(line: 52, column: 10, scope: !82)
!88 = !DILocation(line: 53, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !82, file: !17, line: 53, column: 9)
!90 = !DILocation(line: 53, column: 14, scope: !89)
!91 = !DILocation(line: 53, column: 9, scope: !82)
!92 = !DILocation(line: 53, column: 24, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !17, line: 53, column: 23)
!94 = !DILocation(line: 54, column: 8, scope: !95)
!95 = distinct !DILexicalBlock(scope: !82, file: !17, line: 54, column: 8)
!96 = !DILocation(line: 54, column: 8, scope: !82)
!97 = !DILocation(line: 57, column: 9, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !17, line: 55, column: 5)
!99 = !DILocation(line: 58, column: 5, scope: !98)
!100 = !DILocation(line: 62, column: 17, scope: !101)
!101 = distinct !DILexicalBlock(scope: !95, file: !17, line: 60, column: 5)
!102 = !DILocation(line: 62, column: 9, scope: !101)
!103 = !DILocation(line: 63, column: 9, scope: !101)
!104 = !DILocation(line: 63, column: 20, scope: !101)
!105 = !DILocalVariable(name: "dest", scope: !106, file: !17, line: 66, type: !42)
!106 = distinct !DILexicalBlock(scope: !82, file: !17, line: 65, column: 5)
!107 = !DILocation(line: 66, column: 17, scope: !106)
!108 = !DILocation(line: 68, column: 9, scope: !106)
!109 = !DILocation(line: 68, column: 23, scope: !106)
!110 = !DILocation(line: 68, column: 36, scope: !106)
!111 = !DILocation(line: 68, column: 29, scope: !106)
!112 = !DILocation(line: 68, column: 41, scope: !106)
!113 = !DILocation(line: 69, column: 9, scope: !106)
!114 = !DILocation(line: 69, column: 20, scope: !106)
!115 = !DILocation(line: 70, column: 20, scope: !106)
!116 = !DILocation(line: 70, column: 9, scope: !106)
!117 = !DILocation(line: 71, column: 14, scope: !106)
!118 = !DILocation(line: 71, column: 9, scope: !106)
!119 = !DILocation(line: 73, column: 1, scope: !82)
!120 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 76, type: !18, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!121 = !DILocalVariable(name: "data", scope: !120, file: !17, line: 78, type: !4)
!122 = !DILocation(line: 78, column: 15, scope: !120)
!123 = !DILocation(line: 79, column: 23, scope: !120)
!124 = !DILocation(line: 79, column: 12, scope: !120)
!125 = !DILocation(line: 79, column: 10, scope: !120)
!126 = !DILocation(line: 80, column: 9, scope: !127)
!127 = distinct !DILexicalBlock(scope: !120, file: !17, line: 80, column: 9)
!128 = !DILocation(line: 80, column: 14, scope: !127)
!129 = !DILocation(line: 80, column: 9, scope: !120)
!130 = !DILocation(line: 80, column: 24, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !17, line: 80, column: 23)
!132 = !DILocation(line: 81, column: 8, scope: !133)
!133 = distinct !DILexicalBlock(scope: !120, file: !17, line: 81, column: 8)
!134 = !DILocation(line: 81, column: 8, scope: !120)
!135 = !DILocation(line: 84, column: 17, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !17, line: 82, column: 5)
!137 = !DILocation(line: 84, column: 9, scope: !136)
!138 = !DILocation(line: 85, column: 9, scope: !136)
!139 = !DILocation(line: 85, column: 20, scope: !136)
!140 = !DILocation(line: 86, column: 5, scope: !136)
!141 = !DILocalVariable(name: "dest", scope: !142, file: !17, line: 88, type: !42)
!142 = distinct !DILexicalBlock(scope: !120, file: !17, line: 87, column: 5)
!143 = !DILocation(line: 88, column: 17, scope: !142)
!144 = !DILocation(line: 90, column: 9, scope: !142)
!145 = !DILocation(line: 90, column: 23, scope: !142)
!146 = !DILocation(line: 90, column: 36, scope: !142)
!147 = !DILocation(line: 90, column: 29, scope: !142)
!148 = !DILocation(line: 90, column: 41, scope: !142)
!149 = !DILocation(line: 91, column: 9, scope: !142)
!150 = !DILocation(line: 91, column: 20, scope: !142)
!151 = !DILocation(line: 92, column: 20, scope: !142)
!152 = !DILocation(line: 92, column: 9, scope: !142)
!153 = !DILocation(line: 93, column: 14, scope: !142)
!154 = !DILocation(line: 93, column: 9, scope: !142)
!155 = !DILocation(line: 95, column: 1, scope: !120)
