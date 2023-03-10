; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_declare_ncpy_01.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_ncpy_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_ncpy_01_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !24
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !25
  store i8 0, i8* %arrayidx, align 1, !dbg !26
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !27
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !28
  store i8* %add.ptr, i8** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !30, metadata !DIExpression()), !dbg !32
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !33
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !34
  store i8 0, i8* %arrayidx3, align 1, !dbg !35
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !36
  %0 = load i8*, i8** %data, align 8, !dbg !37
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !38
  %call = call i64 @strlen(i8* %arraydecay5) #6, !dbg !39
  %call6 = call i8* @strncpy(i8* %arraydecay4, i8* %0, i64 %call) #7, !dbg !40
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !41
  store i8 0, i8* %arrayidx7, align 1, !dbg !42
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !43
  call void @printLine(i8* %arraydecay8), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_ncpy_01_good() #0 !dbg !46 {
entry:
  call void @goodG2B(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !54, metadata !DIExpression()), !dbg !55
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %call = call i64 @time(i64* null) #7, !dbg !58
  %conv = trunc i64 %call to i32, !dbg !59
  call void @srand(i32 %conv) #7, !dbg !60
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !61
  call void @CWE127_Buffer_Underread__char_declare_ncpy_01_good(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE127_Buffer_Underread__char_declare_ncpy_01_bad(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !68 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !71, metadata !DIExpression()), !dbg !72
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !73
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !73
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !74
  store i8 0, i8* %arrayidx, align 1, !dbg !75
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !76
  store i8* %arraydecay1, i8** %data, align 8, !dbg !77
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !78, metadata !DIExpression()), !dbg !80
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !81
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !81
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !82
  store i8 0, i8* %arrayidx3, align 1, !dbg !83
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !84
  %0 = load i8*, i8** %data, align 8, !dbg !85
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !86
  %call = call i64 @strlen(i8* %arraydecay5) #6, !dbg !87
  %call6 = call i8* @strncpy(i8* %arraydecay4, i8* %0, i64 %call) #7, !dbg !88
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !89
  store i8 0, i8* %arrayidx7, align 1, !dbg !90
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !91
  call void @printLine(i8* %arraydecay8), !dbg !92
  ret void, !dbg !93
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_declare_ncpy_01.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_ncpy_01_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_ncpy_01.c", directory: "/home/joelyang/SSE-Assessment")
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
!27 = !DILocation(line: 30, column: 12, scope: !11)
!28 = !DILocation(line: 30, column: 23, scope: !11)
!29 = !DILocation(line: 30, column: 10, scope: !11)
!30 = !DILocalVariable(name: "dest", scope: !31, file: !12, line: 32, type: !20)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!32 = !DILocation(line: 32, column: 14, scope: !31)
!33 = !DILocation(line: 33, column: 9, scope: !31)
!34 = !DILocation(line: 34, column: 9, scope: !31)
!35 = !DILocation(line: 34, column: 21, scope: !31)
!36 = !DILocation(line: 36, column: 17, scope: !31)
!37 = !DILocation(line: 36, column: 23, scope: !31)
!38 = !DILocation(line: 36, column: 36, scope: !31)
!39 = !DILocation(line: 36, column: 29, scope: !31)
!40 = !DILocation(line: 36, column: 9, scope: !31)
!41 = !DILocation(line: 38, column: 9, scope: !31)
!42 = !DILocation(line: 38, column: 21, scope: !31)
!43 = !DILocation(line: 39, column: 19, scope: !31)
!44 = !DILocation(line: 39, column: 9, scope: !31)
!45 = !DILocation(line: 41, column: 1, scope: !11)
!46 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_ncpy_01_good", scope: !12, file: !12, line: 68, type: !13, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 70, column: 5, scope: !46)
!48 = !DILocation(line: 71, column: 1, scope: !46)
!49 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 83, type: !50, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{!52, !52, !53}
!52 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !12, line: 83, type: !52)
!55 = !DILocation(line: 83, column: 14, scope: !49)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !12, line: 83, type: !53)
!57 = !DILocation(line: 83, column: 27, scope: !49)
!58 = !DILocation(line: 86, column: 22, scope: !49)
!59 = !DILocation(line: 86, column: 12, scope: !49)
!60 = !DILocation(line: 86, column: 5, scope: !49)
!61 = !DILocation(line: 88, column: 5, scope: !49)
!62 = !DILocation(line: 89, column: 5, scope: !49)
!63 = !DILocation(line: 90, column: 5, scope: !49)
!64 = !DILocation(line: 93, column: 5, scope: !49)
!65 = !DILocation(line: 94, column: 5, scope: !49)
!66 = !DILocation(line: 95, column: 5, scope: !49)
!67 = !DILocation(line: 97, column: 5, scope: !49)
!68 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 48, type: !13, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocalVariable(name: "data", scope: !68, file: !12, line: 50, type: !16)
!70 = !DILocation(line: 50, column: 12, scope: !68)
!71 = !DILocalVariable(name: "dataBuffer", scope: !68, file: !12, line: 51, type: !20)
!72 = !DILocation(line: 51, column: 10, scope: !68)
!73 = !DILocation(line: 52, column: 5, scope: !68)
!74 = !DILocation(line: 53, column: 5, scope: !68)
!75 = !DILocation(line: 53, column: 23, scope: !68)
!76 = !DILocation(line: 55, column: 12, scope: !68)
!77 = !DILocation(line: 55, column: 10, scope: !68)
!78 = !DILocalVariable(name: "dest", scope: !79, file: !12, line: 57, type: !20)
!79 = distinct !DILexicalBlock(scope: !68, file: !12, line: 56, column: 5)
!80 = !DILocation(line: 57, column: 14, scope: !79)
!81 = !DILocation(line: 58, column: 9, scope: !79)
!82 = !DILocation(line: 59, column: 9, scope: !79)
!83 = !DILocation(line: 59, column: 21, scope: !79)
!84 = !DILocation(line: 61, column: 17, scope: !79)
!85 = !DILocation(line: 61, column: 23, scope: !79)
!86 = !DILocation(line: 61, column: 36, scope: !79)
!87 = !DILocation(line: 61, column: 29, scope: !79)
!88 = !DILocation(line: 61, column: 9, scope: !79)
!89 = !DILocation(line: 63, column: 9, scope: !79)
!90 = !DILocation(line: 63, column: 21, scope: !79)
!91 = !DILocation(line: 64, column: 19, scope: !79)
!92 = !DILocation(line: 64, column: 9, scope: !79)
!93 = !DILocation(line: 66, column: 1, scope: !68)
