; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_12_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  store i8* %arraydecay, i8** %data, align 8, !dbg !25
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !26
  %tobool = icmp ne i32 %call, 0, !dbg !26
  br i1 %tobool, label %if.then, label %if.else, !dbg !28

if.then:                                          ; preds = %entry
  %0 = load i8*, i8** %data, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !31
  %1 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  br label %if.end, !dbg !34

if.else:                                          ; preds = %entry
  %2 = load i8*, i8** %data, align 8, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !37
  %3 = load i8*, i8** %data, align 8, !dbg !38
  %arrayidx1 = getelementptr inbounds i8, i8* %3, i64 49, !dbg !38
  store i8 0, i8* %arrayidx1, align 1, !dbg !39
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !40, metadata !DIExpression()), !dbg !45
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !45
  %arraydecay2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !46
  %5 = load i8*, i8** %data, align 8, !dbg !47
  %call3 = call i8* @strcat(i8* %arraydecay2, i8* %5) #5, !dbg !48
  %6 = load i8*, i8** %data, align 8, !dbg !49
  call void @printLine(i8* %6), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i8* @strcat(i8*, i8*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_12_good() #0 !dbg !52 {
entry:
  call void @goodG2B(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #5, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #5, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_12_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_12_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !74 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !79
  store i8* %arraydecay, i8** %data, align 8, !dbg !80
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !81
  %tobool = icmp ne i32 %call, 0, !dbg !81
  br i1 %tobool, label %if.then, label %if.else, !dbg !83

if.then:                                          ; preds = %entry
  %0 = load i8*, i8** %data, align 8, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !86
  %1 = load i8*, i8** %data, align 8, !dbg !87
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !87
  store i8 0, i8* %arrayidx, align 1, !dbg !88
  br label %if.end, !dbg !89

if.else:                                          ; preds = %entry
  %2 = load i8*, i8** %data, align 8, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !92
  %3 = load i8*, i8** %data, align 8, !dbg !93
  %arrayidx1 = getelementptr inbounds i8, i8* %3, i64 49, !dbg !93
  store i8 0, i8* %arrayidx1, align 1, !dbg !94
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !95, metadata !DIExpression()), !dbg !97
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !97
  %arraydecay2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !98
  %5 = load i8*, i8** %data, align 8, !dbg !99
  %call3 = call i8* @strcat(i8* %arraydecay2, i8* %5) #5, !dbg !100
  %6 = load i8*, i8** %data, align 8, !dbg !101
  call void @printLine(i8* %6), !dbg !102
  ret void, !dbg !103
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_12.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_12_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_12.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocation(line: 27, column: 12, scope: !11)
!25 = !DILocation(line: 27, column: 10, scope: !11)
!26 = !DILocation(line: 28, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!28 = !DILocation(line: 28, column: 8, scope: !11)
!29 = !DILocation(line: 31, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !12, line: 29, column: 5)
!31 = !DILocation(line: 31, column: 9, scope: !30)
!32 = !DILocation(line: 32, column: 9, scope: !30)
!33 = !DILocation(line: 32, column: 21, scope: !30)
!34 = !DILocation(line: 33, column: 5, scope: !30)
!35 = !DILocation(line: 37, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !27, file: !12, line: 35, column: 5)
!37 = !DILocation(line: 37, column: 9, scope: !36)
!38 = !DILocation(line: 38, column: 9, scope: !36)
!39 = !DILocation(line: 38, column: 20, scope: !36)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !12, line: 41, type: !42)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 50)
!45 = !DILocation(line: 41, column: 14, scope: !41)
!46 = !DILocation(line: 43, column: 16, scope: !41)
!47 = !DILocation(line: 43, column: 22, scope: !41)
!48 = !DILocation(line: 43, column: 9, scope: !41)
!49 = !DILocation(line: 44, column: 19, scope: !41)
!50 = !DILocation(line: 44, column: 9, scope: !41)
!51 = !DILocation(line: 46, column: 1, scope: !11)
!52 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_12_good", scope: !12, file: !12, line: 79, type: !13, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 81, column: 5, scope: !52)
!54 = !DILocation(line: 82, column: 1, scope: !52)
!55 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 94, type: !56, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!58, !58, !59}
!58 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !12, line: 94, type: !58)
!61 = !DILocation(line: 94, column: 14, scope: !55)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !12, line: 94, type: !59)
!63 = !DILocation(line: 94, column: 27, scope: !55)
!64 = !DILocation(line: 97, column: 22, scope: !55)
!65 = !DILocation(line: 97, column: 12, scope: !55)
!66 = !DILocation(line: 97, column: 5, scope: !55)
!67 = !DILocation(line: 99, column: 5, scope: !55)
!68 = !DILocation(line: 100, column: 5, scope: !55)
!69 = !DILocation(line: 101, column: 5, scope: !55)
!70 = !DILocation(line: 104, column: 5, scope: !55)
!71 = !DILocation(line: 105, column: 5, scope: !55)
!72 = !DILocation(line: 106, column: 5, scope: !55)
!73 = !DILocation(line: 108, column: 5, scope: !55)
!74 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !12, line: 56, type: !16)
!76 = !DILocation(line: 56, column: 12, scope: !74)
!77 = !DILocalVariable(name: "dataBuffer", scope: !74, file: !12, line: 57, type: !20)
!78 = !DILocation(line: 57, column: 10, scope: !74)
!79 = !DILocation(line: 58, column: 12, scope: !74)
!80 = !DILocation(line: 58, column: 10, scope: !74)
!81 = !DILocation(line: 59, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !74, file: !12, line: 59, column: 8)
!83 = !DILocation(line: 59, column: 8, scope: !74)
!84 = !DILocation(line: 62, column: 16, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !12, line: 60, column: 5)
!86 = !DILocation(line: 62, column: 9, scope: !85)
!87 = !DILocation(line: 63, column: 9, scope: !85)
!88 = !DILocation(line: 63, column: 20, scope: !85)
!89 = !DILocation(line: 64, column: 5, scope: !85)
!90 = !DILocation(line: 68, column: 16, scope: !91)
!91 = distinct !DILexicalBlock(scope: !82, file: !12, line: 66, column: 5)
!92 = !DILocation(line: 68, column: 9, scope: !91)
!93 = !DILocation(line: 69, column: 9, scope: !91)
!94 = !DILocation(line: 69, column: 20, scope: !91)
!95 = !DILocalVariable(name: "dest", scope: !96, file: !12, line: 72, type: !42)
!96 = distinct !DILexicalBlock(scope: !74, file: !12, line: 71, column: 5)
!97 = !DILocation(line: 72, column: 14, scope: !96)
!98 = !DILocation(line: 74, column: 16, scope: !96)
!99 = !DILocation(line: 74, column: 22, scope: !96)
!100 = !DILocation(line: 74, column: 9, scope: !96)
!101 = !DILocation(line: 75, column: 19, scope: !96)
!102 = !DILocation(line: 75, column: 9, scope: !96)
!103 = !DILocation(line: 77, column: 1, scope: !74)
