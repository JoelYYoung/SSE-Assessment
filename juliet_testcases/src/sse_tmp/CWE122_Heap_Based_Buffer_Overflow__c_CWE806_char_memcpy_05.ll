; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !11
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_05_bad() #0 !dbg !21 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !26
  store i8* %call, i8** %data, align 8, !dbg !27
  %0 = load i8*, i8** %data, align 8, !dbg !28
  %cmp = icmp eq i8* %0, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !34
  %tobool = icmp ne i32 %1, 0, !dbg !34
  br i1 %tobool, label %if.then1, label %if.end2, !dbg !36

if.then1:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !39
  %3 = load i8*, i8** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !40
  store i8 0, i8* %arrayidx, align 1, !dbg !41
  br label %if.end2, !dbg !42

if.end2:                                          ; preds = %if.then1, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !43, metadata !DIExpression()), !dbg !48
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !48
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !49
  %5 = load i8*, i8** %data, align 8, !dbg !50
  %6 = load i8*, i8** %data, align 8, !dbg !51
  %call3 = call i64 @strlen(i8* %6) #10, !dbg !52
  %mul = mul i64 %call3, 1, !dbg !53
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %5, i64 %mul, i1 false), !dbg !49
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !54
  store i8 0, i8* %arrayidx4, align 1, !dbg !55
  %7 = load i8*, i8** %data, align 8, !dbg !56
  call void @printLine(i8* %7), !dbg !57
  %8 = load i8*, i8** %data, align 8, !dbg !58
  call void @free(i8* %8) #8, !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #6

declare dso_local void @printLine(i8*) #7

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_05_good() #0 !dbg !61 {
entry:
  call void @goodG2B1(), !dbg !62
  call void @goodG2B2(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !65 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_05_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_05_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !83 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !86
  store i8* %call, i8** %data, align 8, !dbg !87
  %0 = load i8*, i8** %data, align 8, !dbg !88
  %cmp = icmp eq i8* %0, null, !dbg !90
  br i1 %cmp, label %if.then, label %if.end, !dbg !91

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !92
  unreachable, !dbg !92

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @staticFalse, align 4, !dbg !94
  %tobool = icmp ne i32 %1, 0, !dbg !94
  br i1 %tobool, label %if.then1, label %if.else, !dbg !96

if.then1:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !97
  br label %if.end2, !dbg !99

if.else:                                          ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !102
  %3 = load i8*, i8** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !103
  store i8 0, i8* %arrayidx, align 1, !dbg !104
  br label %if.end2

if.end2:                                          ; preds = %if.else, %if.then1
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !105, metadata !DIExpression()), !dbg !107
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !107
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !108
  %5 = load i8*, i8** %data, align 8, !dbg !109
  %6 = load i8*, i8** %data, align 8, !dbg !110
  %call3 = call i64 @strlen(i8* %6) #10, !dbg !111
  %mul = mul i64 %call3, 1, !dbg !112
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %5, i64 %mul, i1 false), !dbg !108
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !113
  store i8 0, i8* %arrayidx4, align 1, !dbg !114
  %7 = load i8*, i8** %data, align 8, !dbg !115
  call void @printLine(i8* %7), !dbg !116
  %8 = load i8*, i8** %data, align 8, !dbg !117
  call void @free(i8* %8) #8, !dbg !118
  ret void, !dbg !119
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !120 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !121, metadata !DIExpression()), !dbg !122
  %call = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !123
  store i8* %call, i8** %data, align 8, !dbg !124
  %0 = load i8*, i8** %data, align 8, !dbg !125
  %cmp = icmp eq i8* %0, null, !dbg !127
  br i1 %cmp, label %if.then, label %if.end, !dbg !128

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !129
  unreachable, !dbg !129

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !131
  %tobool = icmp ne i32 %1, 0, !dbg !131
  br i1 %tobool, label %if.then1, label %if.end2, !dbg !133

if.then1:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !134
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !136
  %3 = load i8*, i8** %data, align 8, !dbg !137
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !137
  store i8 0, i8* %arrayidx, align 1, !dbg !138
  br label %if.end2, !dbg !139

if.end2:                                          ; preds = %if.then1, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !140, metadata !DIExpression()), !dbg !142
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !142
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !142
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !143
  %5 = load i8*, i8** %data, align 8, !dbg !144
  %6 = load i8*, i8** %data, align 8, !dbg !145
  %call3 = call i64 @strlen(i8* %6) #10, !dbg !146
  %mul = mul i64 %call3, 1, !dbg !147
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %5, i64 %mul, i1 false), !dbg !143
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !148
  store i8 0, i8* %arrayidx4, align 1, !dbg !149
  %7 = load i8*, i8** %data, align 8, !dbg !150
  call void @printLine(i8* %7), !dbg !151
  %8 = load i8*, i8** %data, align 8, !dbg !152
  call void @free(i8* %8) #8, !dbg !153
  ret void, !dbg !154
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

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !13, line: 25, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !13, line: 26, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_05_bad", scope: !13, file: !13, line: 30, type: !22, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !13, line: 32, type: !6)
!25 = !DILocation(line: 32, column: 12, scope: !21)
!26 = !DILocation(line: 33, column: 20, scope: !21)
!27 = !DILocation(line: 33, column: 10, scope: !21)
!28 = !DILocation(line: 34, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !21, file: !13, line: 34, column: 9)
!30 = !DILocation(line: 34, column: 14, scope: !29)
!31 = !DILocation(line: 34, column: 9, scope: !21)
!32 = !DILocation(line: 34, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !13, line: 34, column: 23)
!34 = !DILocation(line: 35, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !21, file: !13, line: 35, column: 8)
!36 = !DILocation(line: 35, column: 8, scope: !21)
!37 = !DILocation(line: 38, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !13, line: 36, column: 5)
!39 = !DILocation(line: 38, column: 9, scope: !38)
!40 = !DILocation(line: 39, column: 9, scope: !38)
!41 = !DILocation(line: 39, column: 21, scope: !38)
!42 = !DILocation(line: 40, column: 5, scope: !38)
!43 = !DILocalVariable(name: "dest", scope: !44, file: !13, line: 42, type: !45)
!44 = distinct !DILexicalBlock(scope: !21, file: !13, line: 41, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 400, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 50)
!48 = !DILocation(line: 42, column: 14, scope: !44)
!49 = !DILocation(line: 44, column: 9, scope: !44)
!50 = !DILocation(line: 44, column: 22, scope: !44)
!51 = !DILocation(line: 44, column: 35, scope: !44)
!52 = !DILocation(line: 44, column: 28, scope: !44)
!53 = !DILocation(line: 44, column: 40, scope: !44)
!54 = !DILocation(line: 45, column: 9, scope: !44)
!55 = !DILocation(line: 45, column: 20, scope: !44)
!56 = !DILocation(line: 46, column: 19, scope: !44)
!57 = !DILocation(line: 46, column: 9, scope: !44)
!58 = !DILocation(line: 47, column: 14, scope: !44)
!59 = !DILocation(line: 47, column: 9, scope: !44)
!60 = !DILocation(line: 49, column: 1, scope: !21)
!61 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_05_good", scope: !13, file: !13, line: 104, type: !22, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!62 = !DILocation(line: 106, column: 5, scope: !61)
!63 = !DILocation(line: 107, column: 5, scope: !61)
!64 = !DILocation(line: 108, column: 1, scope: !61)
!65 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 120, type: !66, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!66 = !DISubroutineType(types: !67)
!67 = !{!14, !14, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !13, line: 120, type: !14)
!70 = !DILocation(line: 120, column: 14, scope: !65)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !13, line: 120, type: !68)
!72 = !DILocation(line: 120, column: 27, scope: !65)
!73 = !DILocation(line: 123, column: 22, scope: !65)
!74 = !DILocation(line: 123, column: 12, scope: !65)
!75 = !DILocation(line: 123, column: 5, scope: !65)
!76 = !DILocation(line: 125, column: 5, scope: !65)
!77 = !DILocation(line: 126, column: 5, scope: !65)
!78 = !DILocation(line: 127, column: 5, scope: !65)
!79 = !DILocation(line: 130, column: 5, scope: !65)
!80 = !DILocation(line: 131, column: 5, scope: !65)
!81 = !DILocation(line: 132, column: 5, scope: !65)
!82 = !DILocation(line: 134, column: 5, scope: !65)
!83 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 56, type: !22, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!84 = !DILocalVariable(name: "data", scope: !83, file: !13, line: 58, type: !6)
!85 = !DILocation(line: 58, column: 12, scope: !83)
!86 = !DILocation(line: 59, column: 20, scope: !83)
!87 = !DILocation(line: 59, column: 10, scope: !83)
!88 = !DILocation(line: 60, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !83, file: !13, line: 60, column: 9)
!90 = !DILocation(line: 60, column: 14, scope: !89)
!91 = !DILocation(line: 60, column: 9, scope: !83)
!92 = !DILocation(line: 60, column: 24, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !13, line: 60, column: 23)
!94 = !DILocation(line: 61, column: 8, scope: !95)
!95 = distinct !DILexicalBlock(scope: !83, file: !13, line: 61, column: 8)
!96 = !DILocation(line: 61, column: 8, scope: !83)
!97 = !DILocation(line: 64, column: 9, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !13, line: 62, column: 5)
!99 = !DILocation(line: 65, column: 5, scope: !98)
!100 = !DILocation(line: 69, column: 16, scope: !101)
!101 = distinct !DILexicalBlock(scope: !95, file: !13, line: 67, column: 5)
!102 = !DILocation(line: 69, column: 9, scope: !101)
!103 = !DILocation(line: 70, column: 9, scope: !101)
!104 = !DILocation(line: 70, column: 20, scope: !101)
!105 = !DILocalVariable(name: "dest", scope: !106, file: !13, line: 73, type: !45)
!106 = distinct !DILexicalBlock(scope: !83, file: !13, line: 72, column: 5)
!107 = !DILocation(line: 73, column: 14, scope: !106)
!108 = !DILocation(line: 75, column: 9, scope: !106)
!109 = !DILocation(line: 75, column: 22, scope: !106)
!110 = !DILocation(line: 75, column: 35, scope: !106)
!111 = !DILocation(line: 75, column: 28, scope: !106)
!112 = !DILocation(line: 75, column: 40, scope: !106)
!113 = !DILocation(line: 76, column: 9, scope: !106)
!114 = !DILocation(line: 76, column: 20, scope: !106)
!115 = !DILocation(line: 77, column: 19, scope: !106)
!116 = !DILocation(line: 77, column: 9, scope: !106)
!117 = !DILocation(line: 78, column: 14, scope: !106)
!118 = !DILocation(line: 78, column: 9, scope: !106)
!119 = !DILocation(line: 80, column: 1, scope: !83)
!120 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 83, type: !22, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!121 = !DILocalVariable(name: "data", scope: !120, file: !13, line: 85, type: !6)
!122 = !DILocation(line: 85, column: 12, scope: !120)
!123 = !DILocation(line: 86, column: 20, scope: !120)
!124 = !DILocation(line: 86, column: 10, scope: !120)
!125 = !DILocation(line: 87, column: 9, scope: !126)
!126 = distinct !DILexicalBlock(scope: !120, file: !13, line: 87, column: 9)
!127 = !DILocation(line: 87, column: 14, scope: !126)
!128 = !DILocation(line: 87, column: 9, scope: !120)
!129 = !DILocation(line: 87, column: 24, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !13, line: 87, column: 23)
!131 = !DILocation(line: 88, column: 8, scope: !132)
!132 = distinct !DILexicalBlock(scope: !120, file: !13, line: 88, column: 8)
!133 = !DILocation(line: 88, column: 8, scope: !120)
!134 = !DILocation(line: 91, column: 16, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !13, line: 89, column: 5)
!136 = !DILocation(line: 91, column: 9, scope: !135)
!137 = !DILocation(line: 92, column: 9, scope: !135)
!138 = !DILocation(line: 92, column: 20, scope: !135)
!139 = !DILocation(line: 93, column: 5, scope: !135)
!140 = !DILocalVariable(name: "dest", scope: !141, file: !13, line: 95, type: !45)
!141 = distinct !DILexicalBlock(scope: !120, file: !13, line: 94, column: 5)
!142 = !DILocation(line: 95, column: 14, scope: !141)
!143 = !DILocation(line: 97, column: 9, scope: !141)
!144 = !DILocation(line: 97, column: 22, scope: !141)
!145 = !DILocation(line: 97, column: 35, scope: !141)
!146 = !DILocation(line: 97, column: 28, scope: !141)
!147 = !DILocation(line: 97, column: 40, scope: !141)
!148 = !DILocation(line: 98, column: 9, scope: !141)
!149 = !DILocation(line: 98, column: 20, scope: !141)
!150 = !DILocation(line: 99, column: 19, scope: !141)
!151 = !DILocation(line: 99, column: 9, scope: !141)
!152 = !DILocation(line: 100, column: 14, scope: !141)
!153 = !DILocation(line: 100, column: 9, scope: !141)
!154 = !DILocation(line: 102, column: 1, scope: !120)
