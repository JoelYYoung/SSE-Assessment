; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_12.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_cpy_12_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !24
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !25
  store i8 0, i8* %arrayidx, align 1, !dbg !26
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !27
  %tobool = icmp ne i32 %call, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.else, !dbg !29

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !30
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !32
  store i8* %add.ptr, i8** %data, align 8, !dbg !33
  br label %if.end, !dbg !34

if.else:                                          ; preds = %entry
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !35
  store i8* %arraydecay2, i8** %data, align 8, !dbg !37
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %arraydecay3 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay3, i8 67, i64 199, i1 false), !dbg !44
  %arrayidx4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !45
  store i8 0, i8* %arrayidx4, align 1, !dbg !46
  %arraydecay5 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !47
  %0 = load i8*, i8** %data, align 8, !dbg !48
  %call6 = call i8* @strcpy(i8* %arraydecay5, i8* %0) #5, !dbg !49
  %arraydecay7 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !50
  call void @printLine(i8* %arraydecay7), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i32 @globalReturnsTrueOrFalse(...) #3

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_cpy_12_good() #0 !dbg !53 {
entry:
  call void @goodG2B(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #5, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #5, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE127_Buffer_Underread__char_declare_cpy_12_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE127_Buffer_Underread__char_declare_cpy_12_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !75 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !80
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !80
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !81
  store i8 0, i8* %arrayidx, align 1, !dbg !82
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !83
  %tobool = icmp ne i32 %call, 0, !dbg !83
  br i1 %tobool, label %if.then, label %if.else, !dbg !85

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !86
  store i8* %arraydecay1, i8** %data, align 8, !dbg !88
  br label %if.end, !dbg !89

if.else:                                          ; preds = %entry
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !90
  store i8* %arraydecay2, i8** %data, align 8, !dbg !92
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !93, metadata !DIExpression()), !dbg !95
  %arraydecay3 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay3, i8 67, i64 199, i1 false), !dbg !96
  %arrayidx4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !97
  store i8 0, i8* %arrayidx4, align 1, !dbg !98
  %arraydecay5 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !99
  %0 = load i8*, i8** %data, align 8, !dbg !100
  %call6 = call i8* @strcpy(i8* %arraydecay5, i8* %0) #5, !dbg !101
  %arraydecay7 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !102
  call void @printLine(i8* %arraydecay7), !dbg !103
  ret void, !dbg !104
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_12.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_cpy_12_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!24 = !DILocation(line: 27, column: 5, scope: !11)
!25 = !DILocation(line: 28, column: 5, scope: !11)
!26 = !DILocation(line: 28, column: 23, scope: !11)
!27 = !DILocation(line: 29, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 8)
!29 = !DILocation(line: 29, column: 8, scope: !11)
!30 = !DILocation(line: 32, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !12, line: 30, column: 5)
!32 = !DILocation(line: 32, column: 27, scope: !31)
!33 = !DILocation(line: 32, column: 14, scope: !31)
!34 = !DILocation(line: 33, column: 5, scope: !31)
!35 = !DILocation(line: 37, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !28, file: !12, line: 35, column: 5)
!37 = !DILocation(line: 37, column: 14, scope: !36)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !12, line: 40, type: !40)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 39, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 200)
!43 = !DILocation(line: 40, column: 14, scope: !39)
!44 = !DILocation(line: 41, column: 9, scope: !39)
!45 = !DILocation(line: 42, column: 9, scope: !39)
!46 = !DILocation(line: 42, column: 23, scope: !39)
!47 = !DILocation(line: 44, column: 16, scope: !39)
!48 = !DILocation(line: 44, column: 22, scope: !39)
!49 = !DILocation(line: 44, column: 9, scope: !39)
!50 = !DILocation(line: 45, column: 19, scope: !39)
!51 = !DILocation(line: 45, column: 9, scope: !39)
!52 = !DILocation(line: 47, column: 1, scope: !11)
!53 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_cpy_12_good", scope: !12, file: !12, line: 81, type: !13, scopeLine: 82, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 83, column: 5, scope: !53)
!55 = !DILocation(line: 84, column: 1, scope: !53)
!56 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 96, type: !57, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!59, !59, !60}
!59 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !12, line: 96, type: !59)
!62 = !DILocation(line: 96, column: 14, scope: !56)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !12, line: 96, type: !60)
!64 = !DILocation(line: 96, column: 27, scope: !56)
!65 = !DILocation(line: 99, column: 22, scope: !56)
!66 = !DILocation(line: 99, column: 12, scope: !56)
!67 = !DILocation(line: 99, column: 5, scope: !56)
!68 = !DILocation(line: 101, column: 5, scope: !56)
!69 = !DILocation(line: 102, column: 5, scope: !56)
!70 = !DILocation(line: 103, column: 5, scope: !56)
!71 = !DILocation(line: 106, column: 5, scope: !56)
!72 = !DILocation(line: 107, column: 5, scope: !56)
!73 = !DILocation(line: 108, column: 5, scope: !56)
!74 = !DILocation(line: 110, column: 5, scope: !56)
!75 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", scope: !75, file: !12, line: 57, type: !16)
!77 = !DILocation(line: 57, column: 12, scope: !75)
!78 = !DILocalVariable(name: "dataBuffer", scope: !75, file: !12, line: 58, type: !20)
!79 = !DILocation(line: 58, column: 10, scope: !75)
!80 = !DILocation(line: 59, column: 5, scope: !75)
!81 = !DILocation(line: 60, column: 5, scope: !75)
!82 = !DILocation(line: 60, column: 23, scope: !75)
!83 = !DILocation(line: 61, column: 8, scope: !84)
!84 = distinct !DILexicalBlock(scope: !75, file: !12, line: 61, column: 8)
!85 = !DILocation(line: 61, column: 8, scope: !75)
!86 = !DILocation(line: 64, column: 16, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !12, line: 62, column: 5)
!88 = !DILocation(line: 64, column: 14, scope: !87)
!89 = !DILocation(line: 65, column: 5, scope: !87)
!90 = !DILocation(line: 69, column: 16, scope: !91)
!91 = distinct !DILexicalBlock(scope: !84, file: !12, line: 67, column: 5)
!92 = !DILocation(line: 69, column: 14, scope: !91)
!93 = !DILocalVariable(name: "dest", scope: !94, file: !12, line: 72, type: !40)
!94 = distinct !DILexicalBlock(scope: !75, file: !12, line: 71, column: 5)
!95 = !DILocation(line: 72, column: 14, scope: !94)
!96 = !DILocation(line: 73, column: 9, scope: !94)
!97 = !DILocation(line: 74, column: 9, scope: !94)
!98 = !DILocation(line: 74, column: 23, scope: !94)
!99 = !DILocation(line: 76, column: 16, scope: !94)
!100 = !DILocation(line: 76, column: 22, scope: !94)
!101 = !DILocation(line: 76, column: 9, scope: !94)
!102 = !DILocation(line: 77, column: 19, scope: !94)
!103 = !DILocation(line: 77, column: 9, scope: !94)
!104 = !DILocation(line: 79, column: 1, scope: !75)
