; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_14.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_14_bad() #0 !dbg !16 {
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
  %2 = load i32, i32* @globalFive, align 4, !dbg !31
  %cmp1 = icmp eq i32 %2, 5, !dbg !33
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !34

if.then2:                                         ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !35
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #8, !dbg !37
  %4 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  br label %if.end4, !dbg !40

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !41, metadata !DIExpression()), !dbg !46
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !46
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !47
  %6 = bitcast i32* %arraydecay to i8*, !dbg !47
  %7 = load i32*, i32** %data, align 8, !dbg !48
  %8 = bitcast i32* %7 to i8*, !dbg !47
  %9 = load i32*, i32** %data, align 8, !dbg !49
  %call5 = call i64 @wcslen(i32* %9) #10, !dbg !50
  %mul = mul i64 %call5, 4, !dbg !51
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %6, i8* align 4 %8, i64 %mul, i1 false), !dbg !47
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !52
  store i32 0, i32* %arrayidx6, align 4, !dbg !53
  %10 = load i32*, i32** %data, align 8, !dbg !54
  call void @printWLine(i32* %10), !dbg !55
  %11 = load i32*, i32** %data, align 8, !dbg !56
  %12 = bitcast i32* %11 to i8*, !dbg !56
  call void @free(i8* %12) #8, !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #6

declare dso_local void @printWLine(i32*) #7

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_14_good() #0 !dbg !59 {
entry:
  call void @goodG2B1(), !dbg !60
  call void @goodG2B2(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #8, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #8, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_14_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_14_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #7

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !83 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call noalias align 16 i8* @malloc(i64 400) #8, !dbg !86
  %0 = bitcast i8* %call to i32*, !dbg !87
  store i32* %0, i32** %data, align 8, !dbg !88
  %1 = load i32*, i32** %data, align 8, !dbg !89
  %cmp = icmp eq i32* %1, null, !dbg !91
  br i1 %cmp, label %if.then, label %if.end, !dbg !92

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !93
  unreachable, !dbg !93

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @globalFive, align 4, !dbg !95
  %cmp1 = icmp ne i32 %2, 5, !dbg !97
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !98

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !99
  br label %if.end4, !dbg !101

if.else:                                          ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !102
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 49) #8, !dbg !104
  %4 = load i32*, i32** %data, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !105
  store i32 0, i32* %arrayidx, align 4, !dbg !106
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !107, metadata !DIExpression()), !dbg !109
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !109
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !110
  %6 = bitcast i32* %arraydecay to i8*, !dbg !110
  %7 = load i32*, i32** %data, align 8, !dbg !111
  %8 = bitcast i32* %7 to i8*, !dbg !110
  %9 = load i32*, i32** %data, align 8, !dbg !112
  %call5 = call i64 @wcslen(i32* %9) #10, !dbg !113
  %mul = mul i64 %call5, 4, !dbg !114
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %6, i8* align 4 %8, i64 %mul, i1 false), !dbg !110
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !115
  store i32 0, i32* %arrayidx6, align 4, !dbg !116
  %10 = load i32*, i32** %data, align 8, !dbg !117
  call void @printWLine(i32* %10), !dbg !118
  %11 = load i32*, i32** %data, align 8, !dbg !119
  %12 = bitcast i32* %11 to i8*, !dbg !119
  call void @free(i8* %12) #8, !dbg !120
  ret void, !dbg !121
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !122 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !123, metadata !DIExpression()), !dbg !124
  %call = call noalias align 16 i8* @malloc(i64 400) #8, !dbg !125
  %0 = bitcast i8* %call to i32*, !dbg !126
  store i32* %0, i32** %data, align 8, !dbg !127
  %1 = load i32*, i32** %data, align 8, !dbg !128
  %cmp = icmp eq i32* %1, null, !dbg !130
  br i1 %cmp, label %if.then, label %if.end, !dbg !131

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !132
  unreachable, !dbg !132

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @globalFive, align 4, !dbg !134
  %cmp1 = icmp eq i32 %2, 5, !dbg !136
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !137

if.then2:                                         ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !138
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 49) #8, !dbg !140
  %4 = load i32*, i32** %data, align 8, !dbg !141
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !141
  store i32 0, i32* %arrayidx, align 4, !dbg !142
  br label %if.end4, !dbg !143

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !144, metadata !DIExpression()), !dbg !146
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !146
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !146
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !147
  %6 = bitcast i32* %arraydecay to i8*, !dbg !147
  %7 = load i32*, i32** %data, align 8, !dbg !148
  %8 = bitcast i32* %7 to i8*, !dbg !147
  %9 = load i32*, i32** %data, align 8, !dbg !149
  %call5 = call i64 @wcslen(i32* %9) #10, !dbg !150
  %mul = mul i64 %call5, 4, !dbg !151
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %6, i8* align 4 %8, i64 %mul, i1 false), !dbg !147
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !152
  store i32 0, i32* %arrayidx6, align 4, !dbg !153
  %10 = load i32*, i32** %data, align 8, !dbg !154
  call void @printWLine(i32* %10), !dbg !155
  %11 = load i32*, i32** %data, align 8, !dbg !156
  %12 = bitcast i32* %11 to i8*, !dbg !156
  call void @free(i8* %12) #8, !dbg !157
  ret void, !dbg !158
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_14.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_14_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_14.c", directory: "/root/SSE-Assessment")
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
!33 = !DILocation(line: 28, column: 18, scope: !32)
!34 = !DILocation(line: 28, column: 8, scope: !16)
!35 = !DILocation(line: 31, column: 17, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !17, line: 29, column: 5)
!37 = !DILocation(line: 31, column: 9, scope: !36)
!38 = !DILocation(line: 32, column: 9, scope: !36)
!39 = !DILocation(line: 32, column: 21, scope: !36)
!40 = !DILocation(line: 33, column: 5, scope: !36)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !17, line: 35, type: !43)
!42 = distinct !DILexicalBlock(scope: !16, file: !17, line: 34, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 50)
!46 = !DILocation(line: 35, column: 17, scope: !42)
!47 = !DILocation(line: 37, column: 9, scope: !42)
!48 = !DILocation(line: 37, column: 23, scope: !42)
!49 = !DILocation(line: 37, column: 36, scope: !42)
!50 = !DILocation(line: 37, column: 29, scope: !42)
!51 = !DILocation(line: 37, column: 41, scope: !42)
!52 = !DILocation(line: 38, column: 9, scope: !42)
!53 = !DILocation(line: 38, column: 20, scope: !42)
!54 = !DILocation(line: 39, column: 20, scope: !42)
!55 = !DILocation(line: 39, column: 9, scope: !42)
!56 = !DILocation(line: 40, column: 14, scope: !42)
!57 = !DILocation(line: 40, column: 9, scope: !42)
!58 = !DILocation(line: 42, column: 1, scope: !16)
!59 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_14_good", scope: !17, file: !17, line: 97, type: !18, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 99, column: 5, scope: !59)
!61 = !DILocation(line: 100, column: 5, scope: !59)
!62 = !DILocation(line: 101, column: 1, scope: !59)
!63 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 113, type: !64, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!7, !7, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !17, line: 113, type: !7)
!70 = !DILocation(line: 113, column: 14, scope: !63)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !17, line: 113, type: !66)
!72 = !DILocation(line: 113, column: 27, scope: !63)
!73 = !DILocation(line: 116, column: 22, scope: !63)
!74 = !DILocation(line: 116, column: 12, scope: !63)
!75 = !DILocation(line: 116, column: 5, scope: !63)
!76 = !DILocation(line: 118, column: 5, scope: !63)
!77 = !DILocation(line: 119, column: 5, scope: !63)
!78 = !DILocation(line: 120, column: 5, scope: !63)
!79 = !DILocation(line: 123, column: 5, scope: !63)
!80 = !DILocation(line: 124, column: 5, scope: !63)
!81 = !DILocation(line: 125, column: 5, scope: !63)
!82 = !DILocation(line: 127, column: 5, scope: !63)
!83 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 49, type: !18, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !17, line: 51, type: !4)
!85 = !DILocation(line: 51, column: 15, scope: !83)
!86 = !DILocation(line: 52, column: 23, scope: !83)
!87 = !DILocation(line: 52, column: 12, scope: !83)
!88 = !DILocation(line: 52, column: 10, scope: !83)
!89 = !DILocation(line: 53, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !83, file: !17, line: 53, column: 9)
!91 = !DILocation(line: 53, column: 14, scope: !90)
!92 = !DILocation(line: 53, column: 9, scope: !83)
!93 = !DILocation(line: 53, column: 24, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !17, line: 53, column: 23)
!95 = !DILocation(line: 54, column: 8, scope: !96)
!96 = distinct !DILexicalBlock(scope: !83, file: !17, line: 54, column: 8)
!97 = !DILocation(line: 54, column: 18, scope: !96)
!98 = !DILocation(line: 54, column: 8, scope: !83)
!99 = !DILocation(line: 57, column: 9, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !17, line: 55, column: 5)
!101 = !DILocation(line: 58, column: 5, scope: !100)
!102 = !DILocation(line: 62, column: 17, scope: !103)
!103 = distinct !DILexicalBlock(scope: !96, file: !17, line: 60, column: 5)
!104 = !DILocation(line: 62, column: 9, scope: !103)
!105 = !DILocation(line: 63, column: 9, scope: !103)
!106 = !DILocation(line: 63, column: 20, scope: !103)
!107 = !DILocalVariable(name: "dest", scope: !108, file: !17, line: 66, type: !43)
!108 = distinct !DILexicalBlock(scope: !83, file: !17, line: 65, column: 5)
!109 = !DILocation(line: 66, column: 17, scope: !108)
!110 = !DILocation(line: 68, column: 9, scope: !108)
!111 = !DILocation(line: 68, column: 23, scope: !108)
!112 = !DILocation(line: 68, column: 36, scope: !108)
!113 = !DILocation(line: 68, column: 29, scope: !108)
!114 = !DILocation(line: 68, column: 41, scope: !108)
!115 = !DILocation(line: 69, column: 9, scope: !108)
!116 = !DILocation(line: 69, column: 20, scope: !108)
!117 = !DILocation(line: 70, column: 20, scope: !108)
!118 = !DILocation(line: 70, column: 9, scope: !108)
!119 = !DILocation(line: 71, column: 14, scope: !108)
!120 = !DILocation(line: 71, column: 9, scope: !108)
!121 = !DILocation(line: 73, column: 1, scope: !83)
!122 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 76, type: !18, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!123 = !DILocalVariable(name: "data", scope: !122, file: !17, line: 78, type: !4)
!124 = !DILocation(line: 78, column: 15, scope: !122)
!125 = !DILocation(line: 79, column: 23, scope: !122)
!126 = !DILocation(line: 79, column: 12, scope: !122)
!127 = !DILocation(line: 79, column: 10, scope: !122)
!128 = !DILocation(line: 80, column: 9, scope: !129)
!129 = distinct !DILexicalBlock(scope: !122, file: !17, line: 80, column: 9)
!130 = !DILocation(line: 80, column: 14, scope: !129)
!131 = !DILocation(line: 80, column: 9, scope: !122)
!132 = !DILocation(line: 80, column: 24, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !17, line: 80, column: 23)
!134 = !DILocation(line: 81, column: 8, scope: !135)
!135 = distinct !DILexicalBlock(scope: !122, file: !17, line: 81, column: 8)
!136 = !DILocation(line: 81, column: 18, scope: !135)
!137 = !DILocation(line: 81, column: 8, scope: !122)
!138 = !DILocation(line: 84, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !17, line: 82, column: 5)
!140 = !DILocation(line: 84, column: 9, scope: !139)
!141 = !DILocation(line: 85, column: 9, scope: !139)
!142 = !DILocation(line: 85, column: 20, scope: !139)
!143 = !DILocation(line: 86, column: 5, scope: !139)
!144 = !DILocalVariable(name: "dest", scope: !145, file: !17, line: 88, type: !43)
!145 = distinct !DILexicalBlock(scope: !122, file: !17, line: 87, column: 5)
!146 = !DILocation(line: 88, column: 17, scope: !145)
!147 = !DILocation(line: 90, column: 9, scope: !145)
!148 = !DILocation(line: 90, column: 23, scope: !145)
!149 = !DILocation(line: 90, column: 36, scope: !145)
!150 = !DILocation(line: 90, column: 29, scope: !145)
!151 = !DILocation(line: 90, column: 41, scope: !145)
!152 = !DILocation(line: 91, column: 9, scope: !145)
!153 = !DILocation(line: 91, column: 20, scope: !145)
!154 = !DILocation(line: 92, column: 20, scope: !145)
!155 = !DILocation(line: 92, column: 9, scope: !145)
!156 = !DILocation(line: 93, column: 14, scope: !145)
!157 = !DILocation(line: 93, column: 9, scope: !145)
!158 = !DILocation(line: 95, column: 1, scope: !122)
